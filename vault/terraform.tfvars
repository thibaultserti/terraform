kubernetes_host = "https://10.96.0.1:443"

apps = {
  "grafana" = {
    secrets   = ["grafana"]
    namespace = "monitoring"
  },
  "argocd-notifications-controller" = {
    secrets   = ["argocd/notifications"]
    namespace = "argocd"
  }
  "prometheus-stack-kube-prom-alertmanager" = {
    secrets   = ["alertmanager"]
    namespace = "monitoring"
  }
}
