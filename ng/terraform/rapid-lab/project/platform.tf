resource "harness_platform_project" "rapid_project" {
  name        = var.project_name
  identifier  = var.project_name
  org_id      = var.org_name
  description = "Rapid Lab Harness Template Project"
  tags        = var.rapid_lab_tags


}

# module "secrets" {
#   source = "../../modules/secret"
  
#   org_name       = harness_platform_organization.rapid_organization.id
#   project_name   = harness_platform_project.rapid_project.id
#   rapid_lab_tags = var.rapid_lab_tags
  
#   secrets        = var.secrets

# }
