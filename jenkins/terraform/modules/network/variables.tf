variable "resource_group_name" {
    description = "Nombre del Resource Group donde se crea la red"
    type = string 
}

variable "location" {
    description = "Region de azure"
    type = string
}

variable "vnet_name" {
    description = "Nombre de la Virtual Network"
    type = string
}

variable "vnet_address_space" {
    description = "CIDR de la Virtual Network"
    type = list(string)
}

variable "subnet_name" {
    description = "Nombre de la subnet"
    type = string
}

variable "subnet_address_prefixes" {
    description = "CIDR de la subnet"
    type        = list(string)
}

variable "tags" {
  description = "Tags de los recursos"
  type        = map(string)
  default     = {}
}