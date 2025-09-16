terraform {
  required_version = ">= 1.5.0, <2.0.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 5.3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.45.0"
    }
  }
}
