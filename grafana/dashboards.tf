resource "grafana_dashboard" "dashboards" {
  for_each = { for obj in var.dashboards : obj.name => obj }

  org_id      = var.org_id
  config_json = file(format("files/%s.json", each.value.name))
  folder      = grafana_folder.folders[each.value.folder].uid
  overwrite   = true
}
