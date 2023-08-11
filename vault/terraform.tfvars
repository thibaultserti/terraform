kubernetes_host = "https://10.96.0.1:443"

apps = {
  grafana = {
    secrets   = ["grafana"]
    namespace = "monitoring"
  }
  argocd-notifications-controller = {
    secrets   = ["argocd/notifications"]
    namespace = "argocd"
  }
  prometheus-stack-kube-prom-alertmanager = {
    secrets   = ["alertmanager"]
    namespace = "monitoring"
  }
  pihole-exporter = {
    secrets   = ["pihole-exporter"]
    namespace = "monitoring"
  }
  robusta-runner-service-account = {
    secrets   = ["robusta"]
    namespace = "monitoring"
  }
  minio = {
    secrets   = ["minio"]
    namespace = "minio"
  }
  loki = {
    secrets   = ["loki"]
    namespace = "monitoring"
  }
  tempo = {
    secrets   = ["tempo"]
    namespace = "monitoring"
  }
  vault-snapshot = {
    secrets   = ["vault-snapshot"]
    namespace = "vault"
  }
}
