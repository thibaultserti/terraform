resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "auth_backend_config" {
  backend         = vault_auth_backend.kubernetes.path
  kubernetes_host = var.kubernetes_host
}

resource "vault_kubernetes_auth_backend_role" "roles" {
  for_each                         = var.apps
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = each.key
  bound_service_account_names      = [each.key]
  bound_service_account_namespaces = [each.value.namespace]
  token_ttl                        = 3600
  token_policies                   = [each.key]
  audience                         = null
}