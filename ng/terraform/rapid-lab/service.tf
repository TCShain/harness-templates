resource "harness_platform_service" "rapid_service" {
  name        = var.service_name
  identifier  = var.service_identifier
  org_id      = var.org_id
  project_id  = var.project_identifier
  description = "Rapid Lab Harness Template Service"

  tags = [
    var.rapid_lab_tag
  ]
}