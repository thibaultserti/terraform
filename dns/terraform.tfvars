# providers

domain_name      = "ayanides.cloud"
tailscale_domain = "taildcc0a.ts.net"

# records

lb_host = "eros"

host_records = {
  "eros"   = "192.168.1.40"
  "tycho"  = "192.168.1.41"
  "pallas" = "192.168.1.42"
  "ceres"  = "192.168.1.43"
  "box"    = "192.168.0.1"
  "router" = "192.168.1.1"
  "belt"   = "192.168.1.101"
}

records_internal = [
  "pihole",
  "semaphore"
]
records_external = []
