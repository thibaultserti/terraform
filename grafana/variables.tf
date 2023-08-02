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
