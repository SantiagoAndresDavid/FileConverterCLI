### `variables.tf`

variable "name" {
  description = "Nombre de la máquina virtual"
  type        = string
}

variable "resource_group_name" {
  description = "Nombre del Resource Group donde se desplegará la máquina virtual"
  type        = string
}

variable "network_interface_id" {
  description = "ID de la interfaz de red asociada a la máquina virtual"
  type        = string
}

variable "location" {
  description = "Región de Azure donde se desplegará la máquina virtual"
  type        = string
}

variable "size" {
  description = "Tamaño o SKU de la máquina virtual"
  type        = string
}

variable "admin_username" {
  description = "Nombre de usuario administrador de la máquina virtual"
  type        = string
}

variable "public_key" {
  description = "Ruta al archivo que contiene la clave pública SSH"
  type        = string
}

variable "os_caching" {
  description = "Tipo de caché utilizado por el disco del sistema operativo"
  type        = string
}

variable "storage_account_type" {
  description = "Tipo de almacenamiento utilizado por el disco del sistema operativo"
  type        = string
}

variable "publisher" {
  description = "Publisher de la imagen del sistema operativo"
  type        = string
}

variable "offer" {
  description = "Oferta de la imagen del sistema operativo"
  type        = string
}

variable "sku" {
  description = "SKU de la imagen del sistema operativo"
  type        = string
}

variable "image_version" {
  description = "Versión de la imagen del sistema operativo"
  type        = string
}


variable "tags" {
  description = "Etiquetas asociadas a la máquina virtual"
  type        = map(string)
  default     = {}
}