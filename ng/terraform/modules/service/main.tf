resource "harness_platform_service" "rapid_service" {
  for_each = var.services

  name        = "${each.value.name}"
  identifier  = "${each.value.name}"
  org_id      = var.org_name
  project_id  = var.project_name
  description = "Rapid Lab Harness Template Service"
  tags        = var.rapid_lab_tags
  
}

