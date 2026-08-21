output "id" {
  description = "ID de la extensión"
  value       = azurerm_virtual_machine_extension.this.id
}

output "name" {
  description = "Nombre de la extensión"
  value       = azurerm_virtual_machine_extension.this.name
}