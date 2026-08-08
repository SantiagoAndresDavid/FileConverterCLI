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