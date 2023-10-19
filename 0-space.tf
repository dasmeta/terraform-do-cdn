module "space" {
  source  = "terraform-do-modules/spaces/digitalocean"
  version = "1.0.0"

  name        = var.name
  environment = var.environment
  region      = var.region
}
