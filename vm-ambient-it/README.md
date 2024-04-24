

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
| [google_compute_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | Ambient.it project | `string` | `"formation-ambient-it"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | `"europe-west1"` | no |
| <a name="input_vms"></a> [vms](#input\_vms) | n/a | <pre>list(object({<br>    name    = string<br>    suffix  = optional(string, "")<br>    ssh_key = string<br>    image   = optional(string, "ubuntu")<br>    type    = optional(string, "e2-standard8")<br>    tags    = optional(list(string), [])<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->