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
    },
    {
      type = "loki"
      name = "loki"
      url  = "http://loki:3100"
      http_headers = {
        X-Scope-OrgID = "1"
      }
      json_data_encoded = {
        maxLines = 1000
        derivedFields = [
          {
            name         = "WithoutDatasource"
            matcherRegex = "(?:traceID|trace_id)=(\\w+)"
            url          = "example.com/$${__value.raw}"
          },
          {
            name          = "WithDatasource"
            matcherRegex  = "(?:traceID|trace_id)=(\\w+)"
            url           = "$${__value.raw}"
            datasourceUid = "tempo"
          }
        ]
      }
    },
    {
      type = "tempo"
      name = "tempo"
      url  = "http://loki:3100"
      http_headers = {
        X-Scope-OrgID = "1"
      }
      json_data_encoded = {
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
          datasourceUid      = "prom"
          spanStartTimeShift = "1h"
          spanEndTimeShift   = "-1h"
          tags               = [{ "key" : "service.name", "value" : "service" }, { "key" : "job" }]
        }
        serviceMap = {
          datasourceUid = "prometheus"
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
      }
    }
  ]
}
