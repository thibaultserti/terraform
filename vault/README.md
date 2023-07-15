<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 3.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_auth_backend.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_kubernetes_auth_backend_config.auth_backend_config](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_config) | resource |
| [vault_kubernetes_auth_backend_role.roles](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_role) | resource |
| [vault_mount.kvv2](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_policy.policies](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apps"></a> [apps](#input\_apps) | Apps to create kubernetes bindings to secrets | <pre>map(<br>    object({<br>      secrets   = list(string)<br>      namespace = string<br>      }<br>  ))</pre> | `{}` | no |
| <a name="input_kubernetes_host"></a> [kubernetes\_host](#input\_kubernetes\_host) | Kubernetes control plane endpoint | `string` | `"https://localhost:6443"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->