variable "resource_group_name" {
  description = "Nombre del Resource Group"
  type        = string
}

variable "location" {
  description = "Región de Azure"
  type        = string
}

variable "vnet_name" {
  description = "Nombre de la Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space de la Virtual Network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Nombre de la subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefixes de la subnet"
  type        = list(string)
}