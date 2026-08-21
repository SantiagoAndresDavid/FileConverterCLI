resource "azurerm_virtual_machine_extension" "this" {
  name                 = var.name
  virtual_machine_id   = var.virtual_machine_id

  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"
  
  
  protected_settings = jsonencode({script = base64encode(var.script_content)})

  tags = var.tags
}
