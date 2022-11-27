locals {
  path    = "/Users/taylorshain/Documents/repos/harness-templates/ng/terraform/module_test/"
  rg_yaml = [for f in fileset("${local.path}", "*.yaml") : yamldecode(file("${local.path}/${f}"))]
}

module "rg" {
  source = "../rg_types"

  account_id     = var.account_id
  
  resource_groups = local.rg_yaml
}

# output "rg_yaml" {
#   value = local.rg_yaml
# }

# output "test" {
#   #value = flatten([for rg in local.rg_yaml : [for rs in rg.resource_sets : setunion(var.rg_type_set_map["${rs}"])]])
#   value = flatten([for rs in local.rg_yaml[0].resource_sets : setunion(var.rg_type_set_map["${rs}"])])
# }