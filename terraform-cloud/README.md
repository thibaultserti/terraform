<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.47.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.47.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_agent_pool.agent_pool](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/agent_pool) | resource |
| [tfe_notification_configuration.notifications](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/notification_configuration) | resource |
| [tfe_workspace.workspaces](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_organization.org](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_pool_name"></a> [agent\_pool\_name](#input\_agent\_pool\_name) | Agent pool name | `string` | `"infra"` | no |
| <a name="input_github_app_installation_id"></a> [github\_app\_installation\_id](#input\_github\_app\_installation\_id) | Can be found here https://app.terraform.io/app/settings/tokens | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Organization name | `string` | `"thibaultserti"` | no |
| <a name="input_ssh_key_id"></a> [ssh\_key\_id](#input\_ssh\_key\_id) | SSH key name to use to clone modules | `string` | n/a | yes |
| <a name="input_token"></a> [token](#input\_token) | Token to authenticate on Terraform Cloud backend | `string` | n/a | yes |
| <a name="input_webhook"></a> [webhook](#input\_webhook) | Slack compatible webhhok url | `string` | n/a | yes |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | n/a | <pre>list(object({<br>    name              = string<br>    description       = string<br>    execution_mode    = optional(string, "agent")<br>    notification_type = optional(string, "slack")<br>    working_directory = optional(string)<br>    vcs_repo          = optional(string, "thibaultserti/terraform")<br>    auto_apply        = optional(bool, true)<br>    webhhok           = optional(string)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
