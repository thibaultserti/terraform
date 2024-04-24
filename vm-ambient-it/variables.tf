variable "project" {
  type        = string
  description = "Ambient.it project"
  default     = "formation-ambient-it"
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
    ssh_key = string
    image   = optional(string, "ubuntu")
    type    = optional(string, "e2-standard8")
    tags    = optional(list(string), [])
  }))
}
