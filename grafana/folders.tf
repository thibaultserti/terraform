resource "grafana_folder" "folders" {
  for_each = toset([for file in fileset("${path.module}/files", "**") : dirname(file) if dirname(file) != "."])
  title    = each.value
}
