module "environments" {
  source = "../../modules/environment"
  
  org_name       = var.org_name
  project_name   = harness_platform_project.reference_project.id
  reference_lab_tags = var.reference_lab_tags
  
  environments = var.environments

}