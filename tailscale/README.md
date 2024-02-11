## Create API Token for Tailscale
1. Go on Tailscale dashboard in Settings > Keys and create API access token. The max expiration is 90 days.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0, <2.0.0 |
| <a name="requirement_tailscale"></a> [tailscale](#requirement\_tailscale) | ~> 0.13.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tailscale"></a> [tailscale](#provider\_tailscale) | ~> 0.13.7 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tailscale_dns_preferences.preferences](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_preferences) | resource |
| [tailscale_dns_search_paths.search](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_search_paths) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | Api key. Must be renewed every 90 days. | `string` | n/a | yes |
| <a name="input_search_domain"></a> [search\_domain](#input\_search\_domain) | Domain name | `string` | n/a | yes |
| <a name="input_tailscale_org_name"></a> [tailscale\_org\_name](#input\_tailscale\_org\_name) | Tailscale org name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
