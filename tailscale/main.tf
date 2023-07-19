terraform {
  required_version = "~> 1.5.0"

  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "~> 0.13.7"
    }
  }
}