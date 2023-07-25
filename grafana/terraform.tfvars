datasources = {
  is_default = "prometheus"
  datasources = [
    {
      type = "prometheus"
      name = "prometheus"
      url  = "http://prometheus-stack-kube-prom-prometheus:9090"
      json_data_encoded = {
        prometheusType    = "Prometheus"
        prometheusVersion = "2.40.1"
      }
    },
    {
      type = "alertmanager"
      name = "alertmanager"
      url  = "http://alertmanager-operated:9093"
      json_data_encoded = {
        implementation             = "prometheus"
        handleGrafanaManagedAlerts = true
      }
    }
  ]
}

folders = ["Network", "GitOps", "Cilium", "Storage"]
dashboards = [
  {
    name   = "blackbox-exporter"
    folder = "Network"
  },
  {
    name   = "argocd"
    folder = "GitOps"
  },
  {
    name   = "pihole"
    folder = "Network"
  },
  {
    name   = "traefik"
    folder = "Network"
  },
  {
    name   = "nginx"
    folder = "Network"
  },
  {
    name = "node-exporter-full"
  },
  {
    name = "prometheus"
  },
  {
    name = "alertmanager"
  },
  {
    name   = "cilium-agent"
    folder = "Cilium"
  },
  {
    name   = "cilium-hubble"
    folder = "Cilium"
  },
  {
    name   = "cilium-operator"
    folder = "Cilium"
  },
  {
    name   = "vault"
    folder = "Storage"
  },
  {
    name   = "minio"
    folder = "Storage"
  },

]
