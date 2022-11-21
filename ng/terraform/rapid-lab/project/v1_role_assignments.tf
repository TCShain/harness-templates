module "role_assignments" {
  source     = "../../modules/rbac/role_assignment"
  depends_on = [
    module.user_groups,
    module.roles,
    module.resource_groups
  ]

  account_id     = var.harness_account_id
  org_name       = var.org_name
  project_name   = harness_platform_project.rapid_project.id
  rapid_lab_tags = var.rapid_lab_tags
  
  role_assignments = var.role_assignments

}