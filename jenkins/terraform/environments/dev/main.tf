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

  resource_group_name = module.resource_group.name
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
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  tags = {
    Project     = "jenkins"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
module "security" {
  source = "../../modules/security"

  name                = var.NSG_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  admin_source_ip = "179.1.228.67/32" // por que se pone la ip publica de mi pc 

  tags = {
    Project     = "jenkins"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}