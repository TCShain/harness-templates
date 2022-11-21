module "services" {
  source = "../../modules/service"
  
  org_name       = var.org_name
  project_name   = harness_platform_project.rapid_project.id
  rapid_lab_tags = var.rapid_lab_tags
  
  services = var.services

}