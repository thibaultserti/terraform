resource "google_storage_bucket" "vault_infra_snapshot" {
  name          = "vault-infra-snapshot"
  location      = "europe-west1"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 90
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_storage_bucket_iam_binding" "vault_infra_snapshot_binding" {
  bucket = google_storage_bucket.vault_infra_snapshot.name
  role   = "roles/storage.objectAdmin"
  members = [
    google_service_account.service_account.member
  ]
}

resource "google_service_account" "service_account" {
  account_id   = "vault-snapshot"
  display_name = "Vault snapshot SA"
  depends_on = [
    google_project_service.serviceusage_iam,
  ]
}

resource "google_project_service" "serviceusage_iam" {
  service = "iam.googleapis.com"
  depends_on = [
    google_project_service.serviceusage_crm
  ]
}

resource "google_project_service" "serviceusage_crm" {
  service = "cloudresourcemanager.googleapis.com"
}
