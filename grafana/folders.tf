resource "grafana_folder" "folders" {
  for_each = toset(var.folders)
  title    = each.value
}
