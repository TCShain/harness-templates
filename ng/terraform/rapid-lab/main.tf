resource "harness_platform_project" "rapid_project" {
  name        = var.project_name
  description = "Rapid Lab Harness Template Project"

  tags = [
    "harness_template:rapid_lab"
  ]
}