variable "minio_server" {
  type        = string
  description = "Minio hostname"
  default     = "minio-api.ayanides.cloud"
}

variable "minio_user" {
  type        = string
  description = "Minio user"
  default     = "terraform"
}

variable "minio_password" {
  type        = string
  description = "Minio password"
}

variable "buckets" {
  type = list(object({
    name  = string
    acl   = optional(string, "private")
    quota = optional(number, 1000000000)
  }))

}