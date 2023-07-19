provider "tailscale" {
  api_key = var.api_key
  tailnet = var.tailscale_org_name
}
