module "cdn" {
  source  = "terraform-do-modules/cdn/digitalocean"
  version = "1.0.0"
  origin  = module.space.bucket_domain_name
  ttl     = 3600
}
