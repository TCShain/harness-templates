module "services" {
  source = "../../modules/service"
  
  org_name       = var.org_name
  project_name   = harness_platform_project.reference_project.id
  reference_lab_tags = var.reference_lab_tags
  
  services = var.services

}