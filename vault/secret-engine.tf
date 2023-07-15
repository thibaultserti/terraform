resource "vault_mount" "kvv2" {
  path        = "internal/"
  type        = "kv-v2"
  description = "Internal secrets"
}