## Create App role for Terraform Cloud

1. Set environment vars:

```bash
$ export VAULT_ADDR=https://vault.ayanides.cloud
$ export VAULT_TOKEN=
```

2. Create a policy named terraform:

```bash
$ vault policy write terraform - <<EOF
path "sys/health"
{
  capabilities = ["read", "sudo"]
}


path "sys/policies/acl"
{
  capabilities = ["list"]
}


path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}


path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

path "sys/auth"
{
  capabilities = ["read"]
}


path "secret/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/mounts"
{
  capabilities = ["read"]
}

path "auth/token/create" {
  capabilities = ["create", "read", "update", "list"]
}
EOF
```

3. Enable approle authentication:

```bash
$ vault auth enable approle
```

4. Create terraform approle:

```bash
$ vault write auth/approle/role/terraform \
  secret_id_ttl=0 \
  token_num_uses=0 \
  token_ttl=0 \
  token_max_ttl=0 \
  secret_id_num_uses=0 \
  token_policies=terraform
```

5. Get approle_id and approle_secret_id:

```bash
$ vault read auth/approle/role/terraform/role-id
$ vault write -f auth/approle/role/terraform/secret-id
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.77.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 3.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.77.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | ~> 3.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_service.serviceusage_crm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.serviceusage_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket.vault_infra_snapshot](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_binding.vault_infra_snapshot_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_binding) | resource |
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
| <a name="input_kvv2_path"></a> [kvv2\_path](#input\_kvv2\_path) | KVv2 secret engine path | `string` | `"secrets"` | no |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | Vault URL | `string` | `"https://vault.ayanides.cloud"` | no |
| <a name="input_vault_role_id"></a> [vault\_role\_id](#input\_vault\_role\_id) | Vault terraform role id | `string` | n/a | yes |
| <a name="input_vault_role_secret_id"></a> [vault\_role\_secret\_id](#input\_vault\_role\_secret\_id) | Vault secret id | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->