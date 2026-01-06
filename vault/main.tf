terraform {
  required_version = ">= 1.5.0, <2.0.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.8.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 7.15.0"
    }
  }
}
