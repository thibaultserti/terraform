

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0, <2.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 5.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.allow_ingress_specific](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.deny_ingress_private](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.ingress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_resource_policy.dayly](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy) | resource |
| [google_project_iam_binding.binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |
| [google_project.gcp_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | Ambient.it project | `string` | `"formation-ambient-it"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | `"europe-west1"` | no |
| <a name="input_vms"></a> [vms](#input\_vms) | n/a | <pre>list(object({<br>    name    = string<br>    suffix  = optional(string, "")<br>    region  = optional(string, "europe-west1")<br>    ssh_key = string<br>    image   = optional(string, "ubuntu-2204-lts")<br>    type    = optional(string, "e2-medium")<br>    tags    = optional(list(string), []) # tags to allow connection to with firewall<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_info"></a> [instance\_info](#output\_instance\_info) | Instance info |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->