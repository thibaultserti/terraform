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
