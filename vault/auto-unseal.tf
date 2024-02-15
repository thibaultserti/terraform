resource "google_service_account" "vault_kms_service_account" {
  account_id   = "vault-unseal"
  display_name = "Vault Unseal SA"
}
resource "google_kms_key_ring" "key_ring" {
  name     = "auto-unseal"
  location = "europe-west1"
}

# Create a crypto key for the key ring
resource "google_kms_crypto_key" "crypto_key" {
  name            = "auto-unseal-key"
  key_ring        = google_kms_key_ring.key_ring.id
  rotation_period = "100000s"
}

# Add the service account to the Keyring
resource "google_kms_key_ring_iam_binding" "vault_iam_kms_binding" {
  key_ring_id = google_kms_key_ring.key_ring.id
  role        = "roles/owner"
  members = [
    google_service_account.vault_kms_service_account.member,
  ]
}
