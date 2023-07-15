kubernetes_host = "https://tycho:6443"

apps = {
  "grafana" = {
    secrets   = ["grafana"]
    namespace = "monitoring"
  }
}