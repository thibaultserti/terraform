

resource "vault_policy" "policies" {
  for_each = var.apps
  name     = each.key

  policy = <<EOT
%{for path in each.value.secrets}
path "${var.kvv2_path}/data/${path}" {
  capabilities = ["read"]
}
%{endfor}
EOT
}
