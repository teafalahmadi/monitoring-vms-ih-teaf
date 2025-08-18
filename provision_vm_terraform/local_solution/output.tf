output "public_ip" {

  value = [for instance in module.virtual_machine : instance.virtual_machine.public_ip_address]

}

output "resource_group_name" {

  value = module.rg.resource_group.name
  
}
