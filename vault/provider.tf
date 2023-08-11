provider "vault" {
  address          = var.vault_address
  skip_child_token = true # https://stackoverflow.com/questions/73034161/permission-denied-on-vault-terraform-provider-token-creation

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_role_secret_id
    }
  }
}

provider "google" {
  project = "infra-390806"
  region  = "europe-west1"
}