
module "resource_groups" {
  source     = "../../modules/rbac/resource_group"
  depends_on = [
    module.environments,
    resource.harness_platform_project.rapid_project
  ]

  account_id     = var.harness_account_id
  org_name       = var.org_name
  project_name   = harness_platform_project.rapid_project.id
  level          = var.level
  rapid_lab_tags = var.rapid_lab_tags
  
  resource_groups = var.resource_groups

}