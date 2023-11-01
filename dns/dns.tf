
### INTERNAL

# Pihole

resource "pihole_dns_record" "host_records" {
  for_each = var.host_records
  domain   = format("%s.%s", each.key, var.domain_name)
  ip       = each.value
}

resource "pihole_cname_record" "pihole_records_internal" {
  for_each = toset(var.records_internal)
  domain   = format("%s.%s", each.key, var.domain_name)
  target   = format("%s.%s", var.lb_host, var.domain_name)
}

resource "pihole_cname_record" "pihole_records_traefik" {
  for_each = toset(var.records_traefik)
  domain   = format("%s.%s", each.key, var.domain_name)
  target   = format("%s.%s", var.traefik_host, var.domain_name)
}

# Cloudflare

resource "cloudflare_record" "cloudflare_records_internal" {
  for_each = toset(var.records_internal)
  zone_id  = var.cloudflare_zone_id
  name     = each.value
  value    = format("%s.%s", var.lb_host, var.tailscale_domain)
  type     = "CNAME"
  ttl      = 3600
  proxied  = false
}

# wildcard is not supported by pihole API, so we manage it separately
resource "cloudflare_record" "wildcard_record" {
  zone_id = var.cloudflare_zone_id
  name    = "*"
  value   = format("%s.%s", var.lb_host, var.tailscale_domain)
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

### EXTERNAL

resource "cloudflare_record" "cloudflare_records_home" {
  zone_id = var.cloudflare_zone_id
  name    = var.home_alias
  value   = var.home_ip
  type    = "A"
  proxied = true

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}
resource "cloudflare_record" "cloudflare_records_external" {
  for_each = toset(var.records_external)
  zone_id  = var.cloudflare_zone_id
  name     = each.value
  value    = format("%s.%s", var.home_alias, var.domain_name)
  type     = "CNAME"
  proxied  = true
}
