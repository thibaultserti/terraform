<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0, <2.0.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |
| <a name="requirement_pihole"></a> [pihole](#requirement\_pihole) | 0.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4.0 |
| <a name="provider_pihole"></a> [pihole](#provider\_pihole) | 0.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.cloudflare_records_external](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.cloudflare_records_home](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.cloudflare_records_internal](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.wildcard_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [pihole_cname_record.pihole_records_internal](https://registry.terraform.io/providers/ryanwholey/pihole/0.2.0/docs/resources/cname_record) | resource |
| [pihole_cname_record.pihole_records_traefik](https://registry.terraform.io/providers/ryanwholey/pihole/0.2.0/docs/resources/cname_record) | resource |
| [pihole_dns_record.host_records](https://registry.terraform.io/providers/ryanwholey/pihole/0.2.0/docs/resources/dns_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | Cloudflare API token | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Zone id to where the records should be edited | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | User domain name | `string` | n/a | yes |
| <a name="input_home_alias"></a> [home\_alias](#input\_home\_alias) | Home alias to be used in DNS | `string` | n/a | yes |
| <a name="input_home_ip"></a> [home\_ip](#input\_home\_ip) | Home IP | `string` | n/a | yes |
| <a name="input_host_records"></a> [host\_records](#input\_host\_records) | Map of the host records | `map(string)` | `{}` | no |
| <a name="input_lb_host"></a> [lb\_host](#input\_lb\_host) | Hostname of the server on which there is the LB | `string` | n/a | yes |
| <a name="input_pihole_api_token"></a> [pihole\_api\_token](#input\_pihole\_api\_token) | Pihole API token | `string` | n/a | yes |
| <a name="input_records_external"></a> [records\_external](#input\_records\_external) | List of the publicly accessible DNS records | `list(string)` | `[]` | no |
| <a name="input_records_internal"></a> [records\_internal](#input\_records\_internal) | List of the only internal accessible DNS records | `list(string)` | `[]` | no |
| <a name="input_records_teleport"></a> [records\_teleport](#input\_records\_teleport) | List of CNAME to teleport | `list(string)` | `[]` | no |
| <a name="input_records_traefik"></a> [records\_traefik](#input\_records\_traefik) | List of the only internal accessible DNS records (hosted on Kubernetes) | `list(string)` | `[]` | no |
| <a name="input_tailscale_domain"></a> [tailscale\_domain](#input\_tailscale\_domain) | Tailscale domain for the user | `string` | n/a | yes |
| <a name="input_traefik_host"></a> [traefik\_host](#input\_traefik\_host) | Hostname of traefik | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->