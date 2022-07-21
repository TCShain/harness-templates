resource "harness_platform_project" "rapid_project" {
  name        = var.project_name
  identifier  = var.project_identifier
  org_id      = var.org_id
  description = "Rapid Lab Harness Template Project"

  tags = [
    var.rapid_lab_tag
  ]
}