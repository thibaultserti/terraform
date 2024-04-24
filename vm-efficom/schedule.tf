data "google_project" "gcp_project" {
  project_id = var.project
}

# Step 2 Bind permission to Compute Service Agent at VM level
resource "google_project_iam_binding" "binding" {
  project = var.project
  role    = "roles/compute.instanceAdmin.v1"
  members = [
    "serviceAccount:service-${data.google_project.gcp_project.number}@compute-system.iam.gserviceaccount.com",
  ]
}
resource "google_compute_resource_policy" "dayly" {
  for_each    = toset([for k, v in var.vms : v.region])
  name        = format("stop-instances-%s", each.value)
  region      = each.value
  description = "Stop instances"
  instance_schedule_policy {
    vm_stop_schedule {
      schedule = "0 19 * * *"
    }
    time_zone = "Europe/Paris"
  }
}
