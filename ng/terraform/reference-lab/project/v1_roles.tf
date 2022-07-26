module "roles" {
  source = "../../modules/rbac/role"

  account_id         = var.harness_account_id
  org_name           = var.org_name
  project_name       = var.project_name
  reference_lab_tags = var.reference_lab_tags
  
  roles = var.roles

}