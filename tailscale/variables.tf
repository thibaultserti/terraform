variable "tailscale_org_name" {
  type        = string
  description = "Tailscale org name"
}

variable "api_key" {
  type        = string
  description = "Api key. Must be renewed every 90 days."
}


variable "search_domain" {
  type        = string
  description = "Domain name"

}