resource "harness_platform_project" "reference_project" {
  name        = var.project_name
  identifier  = var.project_name
  org_id      = var.org_name
  description = "Rapid Lab Harness Template Project"
  tags        = var.reference_lab_tags


}

# module "secrets" {
#   source = "../../modules/secret"
  
#   org_name       = harness_platform_organization.reference_organization.id
#   project_name   = harness_platform_project.reference_project.id
#   reference_lab_tags = var.reference_lab_tags
  
#   secrets        = var.secrets

# }
