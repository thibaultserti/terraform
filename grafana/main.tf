# Copyright (C) 2022 Skale-5 Ops <ops@skale-5.com>

terraform {
  required_version = "~> 1.5.0"

  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 2.1.0"
    }
  }
}