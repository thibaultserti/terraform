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
  "longhorn",
  "ctfd",
  "challenge",
  "argocd",
  "minio",
  "grafana",
  "prometheus",
  "thanos",
  "thanos-bucketweb",
  "thanos-compactor",
  "thanos-storegateway",
  "alertmanager",
  "tempo",
  "loki",
  "pyroscope",
  "hubble",
  "polaris",
  "goldilocks",
  "kyverno",
  "falco",
  "vault",
  "otel",
  "loki.otel",
  "otlp-http.otel",
  "otlp-grpc.otel",
  "port-6831.otel",
  "prometheus.otel",
  "opentelemetry-demo",
  "fastapi-manual-instrumented",
  "ovh-certificate-api",
  "yopass",
  "stirling-pdf",
  "status"
]

records_external = [
  "ctfd",
  "challenge",
  "hotrod",
  "ovh-certificate-api",
  "yopass",
  "stirling-pdf",
  "status"
]


home_alias = "home"
home_ip    = "82.67.32.216"
