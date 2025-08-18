module "rg" {

  source = "../Azure/azurerm_resource_group"

  name = "${local.prefix}-rg"

  location = "Central India"

}

module "vnet" {

  source = "../Azure/azurerm_virtual_network"

  name = "${local.prefix}-vnet"

  location = module.rg.resource_group.location

  resource_group_name = module.rg.resource_group.name

  address_space = local.address_space

}

module "subnet" {

  source = "../Azure/azurem_subnets"

  for_each = local.subnets

  name = each.key

  vnet_name = module.vnet.virtual_network.name

  resource_group_name = module.rg.resource_group.name

  address_prefixes = each.value.address_prefixes


}

module "nsg" {

  source = "../Azure/azurerm_nsg"

  nsg_name = "${local.prefix}-nsg"

  resource_group_name = module.rg.resource_group.name

  location = module.rg.resource_group.location



}

module "nsg_rule" {

  source = "../Azure/azurerm_nsg_rule"

  for_each = local.nsg_rule

  name                       = each.key
  priority                   = each.value.priority
  direction                  = each.value.direction
  access                     = each.value.access
  protocol                   = each.value.protocol
  source_port_range          = each.value.source_port_range
  destination_port_range     = each.value.destination_port_range
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  resource_group_name = module.rg.resource_group.name

  network_security_group_name = module.nsg.network_security_group.name
}

module "public_ip" {

  for_each = local.public_ips

  source = "../Azure/azurerm_public_ip"

  sku = "Basic"

  resource_group_name = module.rg.resource_group.name

  location = module.rg.resource_group.location

  ip_allocation_method = each.value.allocation_method

  public_ip_address_name = each.key

}

module "nics" {

  for_each = local.nics

  source = "../Azure/azurerm_nic"

  resource_group_name = module.rg.resource_group.name

  location = module.rg.resource_group.location

  ip_configuration_name = each.value.ip_configuration_name

  nic_name = each.key

  subnet_id = module.subnet[each.value.subnet].subnet.id

  network_security_group_id = module.nsg.network_security_group.id

  public_ip_address_id = module.public_ip[each.value.public_ip].public_ip.id

}



module "virtual_machine" {

  for_each = local.virtual_machine

  source = "../Azure/azurerm_vm"

  vm_name = "${local.prefix}-${each.key}"

  resource_group_name = module.rg.resource_group.name

  location = module.rg.resource_group.location

  computer_name = each.key

  vm_size = "Standard_D2s_v3"

  username = "azureuser"

  nic_id = module.nics[each.value.nic].nic.id

  public_key = tls_private_key.ssh_key.public_key_openssh



}


