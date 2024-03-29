
# resource "grafana_data_source" "prometheus" {

#   org_id = var.org_id

#   type       = "prometheus"
#   name       = "prometheus"
#   uid        = "prometheus"
#   is_default = true

#   url = "http://prometheus-stack-kube-prom-prometheus:9090"

#   json_data_encoded = jsonencode({
#     prometheusType    = "Prometheus"
#     prometheusVersion = "2.40.1"
#   })
#   http_headers = {
#     X-Scope-OrgID = "1"
#   }
# }


# resource "grafana_data_source" "thanos" {

#   org_id = var.org_id

#   type = "prometheus"
#   name = "thanos"
#   uid  = "thanos"

#   url = "http://thanos-query-frontend:9090"
#   json_data_encoded = jsonencode({
#     prometheusType    = "Thanos"
#     prometheusVersion = "0.31.1"
#     httpMethod        = "POST"
#   })
#   http_headers = {
#     X-Scope-OrgID = "1"
#   }
# }


# resource "grafana_data_source" "mimir" {

#   org_id = var.org_id

#   type = "prometheus"
#   name = "mimir"
#   uid  = "mimir"

#   url = "http://mimir-gateway:8080/prometheus"

#   json_data_encoded = jsonencode({
#     prometheusType    = "Mimir"
#     prometheusVersion = "2.9.1"
#   })
#   http_headers = {
#     X-Scope-OrgID = "1"
#   }
# }


resource "grafana_data_source" "victoria_metrics" {

  org_id = var.org_id

  type       = "prometheus"
  name       = "victoriametrics"
  uid        = "victoriametrics"
  is_default = true

  url = "http://vmsingle-vm-stack-victoria-metrics-k8s-stack.monitoring.svc:8429"

  json_data_encoded = jsonencode({
    prometheusType    = "Prometheus"
    prometheusVersion = "2.50.1"
  })
  http_headers = {
    X-Scope-OrgID = "1"
  }
}


resource "grafana_data_source" "alertmanager" {

  org_id = var.org_id

  type = "alertmanager"
  name = "alertmanager"
  uid  = "alertmanager"

  url = "http://vmalertmanager-vm-stack-victoria-metrics-k8s-stack.monitoring.svc:9093"

  json_data_encoded = jsonencode({
    implementation             = "prometheus"
    handleGrafanaManagedAlerts = true
  })
  http_headers = {
    X-Scope-OrgID = "1"
  }
}

resource "grafana_data_source" "prometheus_alertmanager" {

  org_id = var.org_id

  type = "camptocamp-prometheus-alertmanager-datasource"
  name = "prometheus-alertmanager"
  uid  = "prometheus-alertmanager"

  url = "http://vmalertmanager-vm-stack-victoria-metrics-k8s-stack.monitoring.svc:9093"

  http_headers = {
    X-Scope-OrgID = "1"
  }
}

resource "grafana_data_source" "loki" {

  org_id = var.org_id

  type = "loki"
  name = "loki"
  uid  = "loki"

  url = "http://loki-read.monitoring.svc:3100"

  json_data_encoded = jsonencode({
    maxLines = 1000
    derivedFields = [
      {
        name          = "traceID"
        matcherRegex  = "[\"|'|\\s]*trace_?[i|I][d|D][\"|'|\\s]*[:|=][\"|'|\\s]*(\\w+)"
        url           = "$${__value.raw}"
        datasourceUid = "tempo"
      },
      {
        name          = "spanID"
        matcherRegex  = "[\"|'|\\s]*span_?[i|I][d|D][\"|'|\\s]*[:|=][\"|'|\\s]*(\\w+)"
        url           = "$${__value.raw}"
        datasourceUid = "tempo"
      }
    ]
  })
  http_headers = {
    X-Scope-OrgID = "1"
  }
}

resource "grafana_data_source" "tempo" {

  org_id = var.org_id

  type = "tempo"
  name = "tempo"
  uid  = "tempo"

  url = "http://tempo.monitoring.svc:3100"

  json_data_encoded = jsonencode({
    maxLines = 1000

    tracesToLogsV2 = {
      datasourceUid      = "loki"
      spanStartTimeShift = "1h"
      spanEndTimeShift   = "-1h"
      tags               = ["job", "instance", "pod", "namespace"]
      filterByTraceID    = "false"
      filterBySpanID     = "false"
      customQuery        = "true"
      query              = "method=\"$${__span.tags.method}\""
    }
    tracesToMetrics = {
      datasourceUid      = "victoriametrics"
      spanStartTimeShift = "1h"
      spanEndTimeShift   = "-1h"
      tags               = [{ "key" : "service.name", "value" : "service" }, { "key" : "job" }]
    }
    serviceMap = {
      datasourceUid = "victoriametrics"
    }
    nodeGraph = {
      enabled = true
    }
    search = {
      hide = false
    }
    lokiSearch = {
      datasourceUid = "loki"
    }
    traceQuery = {
      timeShiftEnabled   = true
      spanStartTimeShift = "1h"
      spanEndTimeShift   = "-1h"
    }
    spanBar = {
      type = "Tag"
      tag  = "http.path"
    }
  })
  http_headers = {
    X-Scope-OrgID = "1"
  }
}

resource "grafana_data_source" "pyroscope" {

  org_id = var.org_id

  type = "phlare"
  name = "pyroscope"
  uid  = "pyroscope"

  url = "http://pyroscope.monitoring.svc:4040"

  json_data_encoded = jsonencode({
    backendType = "pyroscope"
  })
  http_headers = {
    X-Scope-OrgID = "1"
  }
}

resource "grafana_data_source" "hubble" {

  org_id = var.org_id

  type = "isovalent-hubble-datasource"
  name = "hubble"
  uid  = "hubble"

  url = "http://hubble-relay.kube-system.svc:80"

  json_data_encoded = jsonencode({
    prometheusDatasourceUid = "victoriametrics"
    tempoDatasourceUid      = "tempo"

  })
  http_headers = {
    X-Scope-OrgID = "1"
  }
}
