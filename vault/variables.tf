variable "kubernetes_host" {
  type        = string
  description = "Kubernetes control plane endpoint"
  default     = "https://localhost:6443"
}

variable "kvv2_path" {
  type        = string
  default     = "internal"
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
