resource "google_compute_firewall" "ingress" {
  name      = "default-ingress"
  network   = "network"
  direction = "INGRESS"

  priority = 1001

  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }
}



resource "google_compute_firewall" "deny_ingress_private" {
  name      = "deny-ingress-private"
  network   = "network"
  direction = "INGRESS"

  priority = 1000

  deny {
    protocol = "all"
  }
  source_ranges      = ["192.168.0.0/16", "172.16.0.0/12", "10.0.0.0/8"]
  destination_ranges = ["192.168.0.0/16", "172.16.0.0/12", "10.0.0.0/8"]
}

resource "google_compute_firewall" "allow_ingress_specific" {
  for_each  = { for obj in var.vms : format("%s%s", obj.name, obj.suffix) => obj if obj.tags != [] }
  name      = format("allow-%s", each.value.name)
  network   = "network"
  direction = "INGRESS"

  priority = 999
  allow {
    protocol = "all"
  }
  source_tags = [each.value.name]
  target_tags = concat([each.value.name], each.value.tags)
}
