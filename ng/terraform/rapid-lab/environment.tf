resource "harness_platform_environment" "rapid_environment" {
  name        = var.environment_name
  identifier  = var.environment_identifier
  org_id      = var.org_id
  type        = var.environment_type
  description = "Rapid Lab Harness Template Project"

  tags = [
    "harness_template:rapid_lab"
  ]
}