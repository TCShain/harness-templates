module "user_groups" {
  source = "../../modules/rbac/user_group"

  account_id     = var.harness_account_id
  org_name       = var.org_name
  project_name   = harness_platform_project.rapid_project.id
  rapid_lab_tags = var.rapid_lab_tags
  
  user_groups = var.user_groups
}