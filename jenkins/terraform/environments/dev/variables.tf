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


variable "public_ip_name" {
  description = "Address space de la Virtual Network"
  type        = string
}

variable "public_ip_sku" {
  description = "SKU de la dirección IP pública"
  type        = string
}

variable "NSG_name" {
  description = "Address space de la Virtual Network"
  type        = string
}

variable "virtual_machine_name" {
  description = "Nombre de la máquina virtual"
  type        = string
}

variable "virtual_machine_size" {
  description = "Tamaño o SKU de la máquina virtual"
  type        = string
}

variable "virtual_machine_admin_username" {
  description = "Nombre de usuario administrador de la máquina virtual"
  type        = string
}

variable "virtual_machine_public_key" {
  description = "Ruta relativa al archivo de clave pública SSH dentro del módulo de entorno"
  type        = string
}

variable "virtual_machine_os_caching" {
  description = "Tipo de caché utilizado por el disco del sistema operativo"
  type        = string
}

variable "virtual_machine_storage_account_type" {
  description = "Tipo de almacenamiento utilizado por el disco del sistema operativo"
  type        = string
}

variable "virtual_machine_publisher" {
  description = "Publisher de la imagen del sistema operativo"
  type        = string
}

variable "virtual_machine_offer" {
  description = "Oferta de la imagen del sistema operativo"
  type        = string
}

variable "virtual_machine_sku" {
  description = "SKU de la imagen del sistema operativo"
  type        = string
}

variable "virtual_machine_version" {
  description = "Versión de la imagen del sistema operativo"
  type        = string
}