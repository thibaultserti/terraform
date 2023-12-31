terraform {
  required_version = "~> 1.5.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.23.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.8.0"
    }
  }
}
