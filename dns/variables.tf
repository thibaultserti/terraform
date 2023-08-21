variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token"
}

variable "pihole_api_token" {
  type        = string
  description = "Pihole API token"
}

variable "cloudflare_zone_id" {
  type    = string
  default = "Zone id to where the records should be edited"

}

variable "domain_name" {
  type    = string
  default = "User domain name"
}

variable "tailscale_domain" {
  type    = string
  default = "Tailscale domain for the user"
}

variable "host_records" {
  type        = map(string)
  description = "Map of the host records"
  default     = {}
}

variable "records_teleport" {
  type        = list(string)
  description = "List of CNAME to teleport"
  default     = []
}

variable "records_internal" {
  type        = list(string)
  description = "List of the only internal accessible DNS records"
  default     = []
}

variable "records_external" {
  type        = list(string)
  description = "List of the publicly accessible DNS records"
  default     = []
}

variable "lb_host" {
  type        = string
  description = "Hostname of the server on which there is the LB"
}
