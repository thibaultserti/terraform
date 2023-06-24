# Copyright (C) 2022 Skale-5 Ops <ops@skale-5.com>

terraform {
  required_version = "~> 1.5.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    pihole = {
      source  = "ryanwholey/pihole"
      version = "0.0.12"
    }
  }

}
