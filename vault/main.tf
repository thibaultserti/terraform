terraform {
  required_version = ">= 1.5.0, <2.0.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.25.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.18.0"
    }
  }
}
