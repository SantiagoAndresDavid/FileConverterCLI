variable "name" {
  description = "Nombre de la extensión"
  type        = string
}

variable "virtual_machine_id" {
  description = "ID de la máquina virtual"
  type        = string
}

variable "script_content" {
  description = "Contenido del script a ejecutar"
  type        = string
}

variable "tags" {
  description = "Tags de la extensión"
  type        = map(string)
  default     = {}
}