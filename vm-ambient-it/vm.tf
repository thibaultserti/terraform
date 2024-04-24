data "google_compute_zones" "available" {
  for_each = toset([for k, v in var.vms : v.region])
  project  = var.project
  region   = each.value
}

resource "google_compute_instance" "default" {
  for_each = { for i, obj in var.vms : i => obj }

  name         = format("%s%s", each.value.name, each.value.suffix)
  machine_type = each.value.type

  zone = data.google_compute_zones.available[each.value.region].names[each.key % length(data.google_compute_zones.available[each.value.region].names)]

  tags = [each.value.name]

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  scheduling {
    preemptible                 = true
    automatic_restart           = false
    provisioning_model          = "SPOT"
    instance_termination_action = "STOP"
  }

  network_interface {
    network    = "network"
    subnetwork = each.value.region
    access_config {
    }
  }

  resource_policies = [
    google_compute_resource_policy.dayly[each.value.region].id
  ]

  metadata = {
    "ssh-keys" = format("user:%s", each.value.ssh_key)
  }

}
