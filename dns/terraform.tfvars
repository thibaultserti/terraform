# providers

domain_name      = "ayanides.cloud"
tailscale_domain = "taildcc0a.ts.net"

# records

lb_host      = "eros"
traefik_host = "traefik"

host_records = {
  "themis" = "192.168.1.30"
  "eros"   = "192.168.1.40"
  "tycho"  = "192.168.1.41"
  "pallas" = "192.168.1.42"
  "ceres"  = "192.168.1.43"
}

records_internal = [
  "pihole",

]

records_traefik = [
]

records_external = [
  "yopass",
  "pdf",
  "semaphore",
  "mealie"
]


home_alias = "root"
home_ip    = "82.67.32.216"
