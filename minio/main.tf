terraform {
  required_version = ">= 1.5.0, <2.0.0"

  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "~> 2.0.0"
    }
  }
}