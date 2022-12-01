resource "harness_platform_organization" "reference_organization" {
  name        = var.org_name
  identifier  = var.org_name
  description = "Rapid Lab Harness Template Organization"
  tags        = var.reference_lab_tags

}

module "user_groups" {
  source = "../../modules/rbac/user_group"

  account_id     = var.harness_account_id
  org_name       = harness_platform_organization.reference_organization.id
  reference_lab_tags = var.reference_lab_tags
  
  user_groups = var.user_groups
}

# module "roles" {
#   source = "../../modules/rbac/role"

#   account_id     = var.harness_account_id
#   org_name       = harness_platform_organization.reference_organization.id
#   reference_lab_tags = var.reference_lab_tags
  
#   roles = var.roles

# }