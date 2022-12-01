module "resource_groups" {
  source     = "../../modules/rbac/resource_group"
  depends_on = [
    module.environments,
    resource.harness_platform_project.reference_project,
    module.services,
    module.roles,
    module.user_groups
  ]

  account_id     = var.harness_account_id
  org_name       = var.org_name
  project_name   = harness_platform_project.reference_project.id
  #level          = var.level
  reference_lab_tags = var.reference_lab_tags
  
  resource_groups = local.rg_yaml

}

locals {
  path = "/Users/taylorshain/Documents/repos/harness-templates/ng/terraform/reference-lab/tfvars/projects/reference-project/yaml"
  rg_yaml = [for f in fileset("${local.path}", "*.yaml") : yamldecode(file("${local.path}/${f}"))]
}