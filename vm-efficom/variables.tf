variable "project" {
  type        = string
  description = "Efficom project"
  default     = "formation-efficom"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "europe-west1"
}

variable "vms" {
  type = list(object({
    name    = string
    suffix  = optional(string, "")
    region  = optional(string, "europe-west1")
    ssh_key = string
    image   = optional(string, "ubuntu-2204-lts")
    type    = optional(string, "e2-medium")
    tags    = optional(list(string), []) # tags to allow connection to with firewall
  }))
}
