<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.0 |
| <a name="requirement_minio"></a> [minio](#requirement\_minio) | ~> 1.16.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_minio"></a> [minio](#provider\_minio) | ~> 1.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [minio_s3_bucket.state_terraform_s3](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buckets"></a> [buckets](#input\_buckets) | n/a | <pre>list(object({<br>    name  = string<br>    acl   = optional(string, "private")<br>    quota = optional(number, 1000000000)<br>  }))</pre> | n/a | yes |
| <a name="input_minio_password"></a> [minio\_password](#input\_minio\_password) | Minio password | `string` | n/a | yes |
| <a name="input_minio_server"></a> [minio\_server](#input\_minio\_server) | Minio hostname | `string` | `"minio-api.ayanides.cloud"` | no |
| <a name="input_minio_user"></a> [minio\_user](#input\_minio\_user) | Minio user | `string` | `"terraform"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
