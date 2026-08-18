output "id" {
  description = "ID de la máquina virtual"
  value       = azurerm_linux_virtual_machine.this.id
}

output "name" {
  description = "Nombre de la máquina virtual"
  value       = azurerm_linux_virtual_machine.this.name
}

output "location" {
  description = "Ubicación de la máquina virtual"
  value       = azurerm_linux_virtual_machine.this.location
}

output "size" {
  description = "Tamaño de la máquina virtual"
  value       = azurerm_linux_virtual_machine.this.size
}

output "admin_username" {
  description = "Nombre de usuario administrador de la máquina virtual"
  value       = azurerm_linux_virtual_machine.this.admin_username
}
