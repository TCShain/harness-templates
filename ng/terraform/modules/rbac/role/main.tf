resource "harness_platform_roles" "reference_role" {
  for_each = {for r in var.roles: r.name => r}
  
  identifier           = each.value.name
  name                 = each.value.name
  org_id               = var.org_name
  project_id           = var.project_name
  description          = each.value.description
  tags                 = var.reference_lab_tags
  permissions          = each.value.permissions
  allowed_scope_levels = each.value.allowed_scope_levels

}