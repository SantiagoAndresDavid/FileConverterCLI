output "vnet_id" {
    description = "ID de la Virtual Network"
    value = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Nombre de la Virtual Network"
  value = azurerm_virtual_network.this.name
}

output "subnet_id" {
    description = "ID de la subnet"
    value = azurerm_subnet.this.id
}

output "subnet_name" {
    description = "Nombre de la subnet"
    value = azurerm_subnet.this.name
}