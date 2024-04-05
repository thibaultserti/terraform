terraform {
  required_version = ">= 1.5.0, <2.0.0"

  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 2.15.0"
    }
  }
}