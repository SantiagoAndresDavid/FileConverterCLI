output "id" {
  description = "ID de la Public IP"
  value       = azurerm_public_ip.this.id
}

output "name" {
  description = "Nombre de la Public IP"
  value       = azurerm_public_ip.this.name
}

output "location" {
  description = "Ubicación de la Public IP"
  value       = azurerm_public_ip.this.location
}