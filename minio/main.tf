terraform {
  required_version = "~> 1.6.0"

  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "~> 1.17.0"
    }
  }
}