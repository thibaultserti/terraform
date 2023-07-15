resource "vault_mount" "kvv2" {
  path        = var.kvv2_path
  type        = "kv-v2"
  description = "Internal secrets"
}