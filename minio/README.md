
# Setup
Create terraform user/password with consoleAdmin right

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0, <2.0.0 |
| <a name="requirement_minio"></a> [minio](#requirement\_minio) | ~> 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_minio"></a> [minio](#provider\_minio) | ~> 2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [minio_iam_policy.policies](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/iam_policy) | resource |
| [minio_iam_user.users](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/iam_user) | resource |
| [minio_iam_user_policy_attachment.developer](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/iam_user_policy_attachment) | resource |
| [minio_ilm_policy.policy](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/ilm_policy) | resource |
| [minio_s3_bucket.state_terraform_s3](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buckets"></a> [buckets](#input\_buckets) | Buckets | <pre>list(object({<br>    name       = string<br>    acl        = optional(string, "private")<br>    quota      = optional(number, 1000000000)<br>    expiration = string<br>  }))</pre> | n/a | yes |
| <a name="input_minio_password"></a> [minio\_password](#input\_minio\_password) | Minio password | `string` | n/a | yes |
| <a name="input_minio_server"></a> [minio\_server](#input\_minio\_server) | Minio hostname | `string` | `"minio-api.ayanides.cloud"` | no |
| <a name="input_minio_user"></a> [minio\_user](#input\_minio\_user) | Minio user | `string` | `"terraform"` | no |
| <a name="input_users"></a> [users](#input\_users) | Users | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
