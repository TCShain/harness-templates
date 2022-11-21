
module "resource_groups" {
  source     = "../../modules/rbac/resource_group"

  account_id     = var.harness_account_id
  rapid_lab_tags = var.rapid_lab_tags
  
  resource_groups = var.resource_groups

}