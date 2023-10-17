# terraform-do-cdn
Module to setup CDN using DO Space and k8s (DOKS)
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | ~> 2.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cdn"></a> [cdn](#module\_cdn) | terraform-do-modules/cdn/digitalocean | 1.0.0 |
| <a name="module_space"></a> [space](#module\_space) | terraform-do-modules/spaces/digitalocean | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [digitalocean_kubernetes_cluster.k8s](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/kubernetes_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Whatever domain this will be hosted under. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Whatever environment CDN setup is deployed for. | `string` | `""` | no |
| <a name="input_k8s"></a> [k8s](#input\_k8s) | k8s (doks) cluster name to inject service. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | DigitalOcean Space Name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region Space should be located in. | `string` | `"fra1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
