# providers

domain_name      = "ayanides.cloud"
tailscale_domain = "taildcc0a.ts.net"

# records

lb_host      = "eros"
traefik_host = "traefik"

host_records = {
  "belt"     = "192.168.1.10"
  "themis"   = "192.168.1.30"
  "eros"     = "192.168.1.40"
  "tycho"    = "192.168.1.41"
  "pallas"   = "192.168.1.42"
  "ceres"    = "192.168.1.43"
  "box"      = "192.168.1.254"
  "traefik"  = "192.168.1.100"
  "teleport" = "192.168.1.101" # teleport
}

records_internal = [
  "pihole",
  "semaphore"
]

records_traefik = [
]

records_external = [
  "ctfd",
  "challenge",
  "hotrod",
  "ovh-certificate-api",
  "yopass",
  "stirling-pdf",
  "status",
  "home",
  "buzzer"
]


home_alias = "root"
home_ip    = "82.67.32.216"
