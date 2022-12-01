resource "harness_platform_resource_group" "reference_resource_group" {
  for_each = {for rg in var.resource_groups : rg.name => rg}

  identifier  = each.value.name
  name        = each.value.name
  description = each.value.description
  tags        = var.reference_lab_tags

  org_id     = var.org_name
  project_id = var.project_name

  account_id = var.account_id

  allowed_scope_levels = each.value.allowed_scope_levels

  included_scopes {
    filter     = each.value.scope_filter
    account_id = var.account_id
    org_id     = var.org_name
    project_id = var.project_name
  }

  resource_filter {
    include_all_resources = false

    dynamic resources {
      for_each = flatten([for t in each.value.resource_sets : setunion(var.rg_type_set_map["${t}"])])
      iterator = rs

      content {
        resource_type = rs.value
      }
    }

    dynamic resources {
      for_each = each.value.resources != null ? each.value.resources : []

      content {
      resource_type = resources.value.resource_type
      identifiers   = resources.value.identifiers 
      
        dynamic attribute_filter {
          for_each = resources.value.attribute_filter != null ? resources.value.attribute_filter : []

          content {
            attribute_name   = attribute_filter.value.attribute_name
            attribute_values = attribute_filter.value.attribute_values
          }
        }
      } 
    }
  }
}