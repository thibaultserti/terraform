resource "grafana_dashboard" "dashboards" {
  for_each = fileset("${path.module}/files", "**")

  org_id      = var.org_id
  config_json = file(format("files/%s", each.value))
  folder      = dirname(each.value) != "." ? grafana_folder.folders[dirname(each.value)].uid : null
  overwrite   = true

  depends_on = [grafana_folder.folders]
}
