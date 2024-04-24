terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "thibaultserti"

    workspaces {
      name = "vm"
    }
  }
}