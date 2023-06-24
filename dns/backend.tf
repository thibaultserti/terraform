terraform {
  backend "gcs" {
    bucket = "ayanides-cloud-tfstates"
    prefix = "dns"
  }
}