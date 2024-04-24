output "instance_info" {
  value       = { for idx, instance in google_compute_instance.default : instance.name => instance.network_interface.0.access_config.0.nat_ip }
  description = "Instance info"
}
