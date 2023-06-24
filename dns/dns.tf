

# Pihole

resource "pihole_dns_record" "host_records" {
  for_each = var.host_records
  domain   = format("%s.%s", each.key, var.domain_name)
  ip       = each.value
}

resource "pihole_cname_record" "record" {
  for_each = toset(var.records_internal)
  domain   = format("%s.%s", each.key, var.domain_name)
  target   = format("%s.%s", var.lb_host, var.domain_name)
}

# Cloudflare

resource "cloudflare_record" "example" {
  for_each = toset(var.records_internal)
  zone_id  = var.cloudflare_zone_id
  name     = each.value
  value    = format("%s.%s", var.lb_host, var.tailscale_domain)
  type     = "CNAME"
  ttl      = 3600
  proxied  = false
}
