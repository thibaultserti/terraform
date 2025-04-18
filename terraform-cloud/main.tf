terraform {
  required_version = ">= 1.5.0, <2.0.0"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.65.0"
    }
  }
}