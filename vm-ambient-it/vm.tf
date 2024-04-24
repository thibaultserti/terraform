data "google_compute_zones" "available" {
  project = var.project
  region  = var.region
}

resource "google_compute_instance" "default" {
  for_each = { for i, obj in var.vms : i => obj }

  name         = format("%s%s", each.value.name, each.value.suffix)
  machine_type = each.value.type
  zone         = data.google_compute_zones.available.names[each.key % length(data.google_compute_zones.available.names)]

  tags = each.value.name

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  scheduling {
    preemptible        = true
    automatic_restart  = false
    provisioning_model = "SPOT"
  }

  network_interface {
    network = "network"
    access_config {
    }
  }

  metadata = {
    "ssh-key" = format("user:%s", each.value.ssh_key)
  }

}
