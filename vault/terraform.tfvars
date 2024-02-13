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
  vmalertmanager-vm-stack-victoria-metrics-k8s-stack = {
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
  longhorn-service-account = {
    secrets   = ["longhorn"]
    namespace = "longhorn-system"
  }
  mimir = {
    secrets   = ["mimir"]
    namespace = "monitoring"
  }
  thanos-query = {
    secrets   = ["thanos"]
    namespace = "monitoring"
  }
  falcosidekick = {
    secrets   = ["falco"]
    namespace = "falco"
  }
  ctfd = {
    secrets   = ["ctfd/ctfd"]
    namespace = "ctfd"
  }
  ctfd-mariadb = {
    secrets   = ["ctfd/mariadb"]
    namespace = "ctfd"
  }
  ctfd-redis = {
    secrets   = ["ctfd/redis"]
    namespace = "ctfd"
  }
  ovh-certificate-api-app = {
    secrets   = ["my-apps/ovh-certificate-api"]
    namespace = "my-apps"
  }
}
