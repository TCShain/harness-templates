resource "harness_platform_role_assignments" "reference_role_assignment" {
  for_each = {for ra in var.role_assignments: ra.identifier => ra}

  #identifier                = each.value.identifier
  org_id                    = var.org_name
  project_id                = var.project_name
  resource_group_identifier = each.value.resource_group_identifier
  role_identifier           = each.value.role_identifier

  disabled = each.value.disabled
  managed  = each.value.managed
  
  dynamic principal {
   #for_each = {for p in each.value.prinicpal: p.type => p}
    for_each = each.value.principal != null ? each.value.principal : []

    content {
      identifier  = principal.value.identifier
      type        = principal.value.type
      scope_level = principal.value.scope_level
    }
  }
  
}