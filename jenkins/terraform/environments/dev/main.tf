module "resource_group" {
  source = "../../modules/resource_group"

  name     = var.resource_group_name
  location = var.location

  tags = {
    Project     = "jenkins"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }

}

module "network" {
  source = "../../modules/network"

  resource_group_name = var.resource_group_name
  location            = var.location

  vnet_name = var.vnet_name

  vnet_address_space = var.vnet_address_space

  subnet_name = var.subnet_name

  subnet_address_prefixes = var.subnet_address_prefixes



  tags = {
    Project     = "jenkins"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

module "public_ip" {
  source = "../../modules/public_ip"

  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku               = var.public_ip_sku

  tags = {
    Project     = "jenkins"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
module "security" {
  source = "../../modules/security"

  name                = var.NSG_name
  resource_group_name = var.resource_group_name
  location            = var.location

  admin_source_ip = "179.1.228.67/32" // por que se pone la ip publica de mi pc 

  tags = {
    Project     = "jenkins"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_network_interface" "this" {
  name                = "${var.virtual_machine_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.network.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = module.public_ip.id
  }

  tags = {
    Project     = "jenkins"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = module.security.id
}

//terminar de migrar todas las variables
module "virtual_machine" {
  source = "../../modules/virtual_machine"

  name                = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.location

  size = var.virtual_machine_size

  admin_username = var.virtual_machine_admin_username

  public_key = file("${path.module}/ssh_keys/${var.virtual_machine_public_key}")

  os_caching              = var.virtual_machine_os_caching
  storage_account_type    = var.virtual_machine_storage_account_type

  publisher = var.virtual_machine_publisher
  offer     = var.virtual_machine_offer
  sku       = var.virtual_machine_sku
  image_version = var.virtual_machine_version

  network_interface_id = azurerm_network_interface.this.id

  tags = {
    Project     = "jenkins"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}