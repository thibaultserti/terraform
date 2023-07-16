kubernetes_host = "https://10.96.0.1:443"

apps = {
  "grafana" = {
    secrets   = ["grafana"]
    namespace = "monitoring"
  }
}