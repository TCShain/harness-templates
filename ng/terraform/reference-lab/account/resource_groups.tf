
module "resource_groups" {
  source     = "../../modules/rbac/resource_group"

  account_id     = var.harness_account_id
  reference_lab_tags = var.reference_lab_tags
  
  resource_groups = local.rg_yaml

}

locals {
  rg_yaml = [for f in fileset("${var.tfvar_yaml_path}", "*.yaml") : yamldecode(file("${var.tfvar_yaml_path}/${f}"))]
}