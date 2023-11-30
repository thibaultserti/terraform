terraform {
  required_version = "~> 1.5.0"

  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 2.7.0"
    }
  }
}