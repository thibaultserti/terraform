variable "vault_address" {
  type        = string
  description = "Vault URL"
  default     = "https://vault.ayanides.cloud"
}

variable "vault_role_id" {
  type        = string
  description = "Vault terraform role id"
}

variable "vault_role_secret_id" {
  type        = string
  description = "Vault secret id"

}
variable "kubernetes_host" {
  type        = string
  description = "Kubernetes control plane endpoint"
  default     = "https://localhost:6443"
}

variable "kvv2_path" {
  type        = string
  default     = "secrets"
  description = "KVv2 secret engine path"
}

variable "apps" {
  type = map(
    object({
      secrets   = list(string)
      namespace = string
      }
  ))
  description = "Apps to create kubernetes bindings to secrets"
  default     = {}
}
