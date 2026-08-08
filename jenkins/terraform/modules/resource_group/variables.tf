variable "name" {
  description = "Nombre del Resource Group"
  type        = string
}

variable "location" {
  description = "Región de Azure"
  type        = string
}

variable "tags" {
  description = "Etiquetas del Resource Group"
  type        = map(string)

  default = {}
}