## Create API Token for Terraform

1. Go on the Grafana URL and create a user named `terraform` with Admin permissions.
2. Set grafana_auth to `terraform:<password>` in Terraform Cloud

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.0 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | ~> 2.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | ~> 2.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_dashboard.dashboards](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/dashboard) | resource |
| [grafana_data_source.datasources](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/data_source) | resource |
| [grafana_folder.folders](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/folder) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datasources"></a> [datasources](#input\_datasources) | Grafana datasources | <pre>object({<br>    is_default = string<br>    datasources = list(<br>      object({<br>        type              = string,<br>        name              = string,<br>        url               = string,<br>        json_data_encoded = optional(map(string))<br>      })<br>    )<br>  })</pre> | <pre>{<br>  "datasources": [],<br>  "is_default": null<br>}</pre> | no |
| <a name="input_grafana_address"></a> [grafana\_address](#input\_grafana\_address) | Grafana URL | `string` | `"https://grafana.ayanides.cloud"` | no |
| <a name="input_grafana_auth"></a> [grafana\_auth](#input\_grafana\_auth) | Grafana API token with the user:password format | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Grafana organization id | `string` | `"1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->