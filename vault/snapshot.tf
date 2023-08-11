resource "vault_policy" "vault_snapshot" {

  name   = "vault-snapshot-operation"
  policy = <<EOT
path "sys/storage/raft/snapshot" {
   capabilities = ["read"]
}
EOT
}

data "vault_auth_backend" "approle" {
  path = "approle"
}

resource "vault_approle_auth_backend_role" "vault_snapshot" {
  backend        = data.vault_auth_backend.approle.path
  role_name      = "vault-snapshot-operation"
  token_ttl      = 3600
  token_policies = ["vault-snapshot-operation"]
}
