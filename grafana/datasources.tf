
resource "grafana_data_source" "datasources" {
  for_each = { for obj in var.datasources.datasources : obj.name => obj }

  org_id = var.org_id

  type       = each.value.type
  name       = each.value.name
  is_default = each.value.name == var.datasources.is_default

  url = each.value.url

  json_data_encoded = jsonencode(each.value.json_data_encoded)
  http_headers      = each.value.http_headers
}
