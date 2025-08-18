variable "firewall_rule_name" {

    type = string
  
}

variable "server_id" {

    type = string
  
}

variable "start_ip_address" {

    type = string

    default = "0.0.0.0"
    
  
}

variable "end_ip_address" {

    type = string

    default = "0.0.0.0"
  
  
}