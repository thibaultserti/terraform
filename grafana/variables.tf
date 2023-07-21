variable "grafana_address" {
  type        = string
  description = "Grafana URL"
  default     = "https://grafana.ayanides.cloud"
}

variable "grafana_auth" {
  type        = string
  description = "Grafana API token with the user:password format"
}

variable "org_id" {
  type        = string
  description = "Grafana organization id"
  default     = "1"
}

variable "datasources" {
  type = object({
    is_default = string
    datasources = list(
      object({
        type              = string,
        name              = string,
        url               = string,
        json_data_encoded = optional(map(string))
      })
    )
  })
  description = "Grafana datasources"
  default = {
    is_default  = null
    datasources = []
  }
}

variable "folders" {
  type        = list(string)
  description = "List of folders to create"
  default     = []
}

variable "dashboards" {
  type = list(
    object({
      name   = string,
      folder = optional(string),
    })
  )

  description = "Grafana dashboards"
  default     = []
}
