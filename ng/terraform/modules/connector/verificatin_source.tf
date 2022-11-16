## Verification Sources
resource "harness_platform_connector_prometheus" "saprom" {
  identifier         = "saprom"
  name               = "sa-prom"
  url                = "http://prometheus-kube-prometheus-prometheus.prometheus.svc.cluster.local:9090/"
  delegate_selectors = ["riley-sa-gcp"]
}