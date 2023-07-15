# Copyright (C) 2022 Skale-5 Ops <ops@skale-5.com>

terraform {
  required_version = "~> 1.5.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.18.0"
    }
  }
}