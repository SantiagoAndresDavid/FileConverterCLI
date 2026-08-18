variable "name" {
  description = "Nombre de la Public IP"
  type        = string
}

variable "resource_group_name" {
  description = "Nombre del Resource Group"
  type        = string
}

variable "location" {
  description = "Región de Azure"
  type        = string
}

variable "tags" {
  description = "Etiquetas de la Public IP"
  type        = map(string)
  default     = {}
}

variable "sku" {
  description = "SKU de la dirección IP pública"
  type        = string
}
