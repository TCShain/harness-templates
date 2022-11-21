module "environments" {
  source = "../../modules/environment"
  
  org_name       = var.org_name
  project_name   = harness_platform_project.rapid_project.id
  rapid_lab_tags = var.rapid_lab_tags
  
  environments = var.environments

}