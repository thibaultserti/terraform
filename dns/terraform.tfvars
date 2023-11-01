# providers

domain_name      = "ayanides.cloud"
tailscale_domain = "taildcc0a.ts.net"

# records

lb_host      = "eros"
traefik_host = "traefik"

host_records = {
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
  "kubernetes",
  "ctfd",
  "challenge",
  "argocd",
  "grafana",
  "prometheus",
  "thanos",
  "alertmanager",
  "tempo",
  "loki",
  "pyroscope",
  "hubble",
  "polaris",
  "kyverno",
  "falco",
  "vault",
  "otel",
  "opentelemetry-demo",
  "fastapi-observability-demo-a",
  "fastapi-observability-demo-b",
  "fastapi-observability-demo-c",
  "fastapi-profiling-demo"

]

records_external = [
  "ctfd",
  "challenges",
  "challenge"
]


home_alias = "home"
home_ip    = "82.67.32.216"
