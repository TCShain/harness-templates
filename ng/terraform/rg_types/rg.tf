

locals {
  rgs = flatten(
          [for t in toset(var.rg_types) :
            setunion(var.rg_type_set_map["${t}"])
          ]
        )
}

resource "harness_platform_resource_group" "rapid_resource_group" {
  for_each = {for rg in var.resource_groups : rg.name => rg}

  identifier  = each.value.name
  name        = each.value.name

  account_id = var.account_id

  allowed_scope_levels = ["account"]

  included_scopes {
    filter     = each.value.scope_filter
    account_id = var.account_id
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

# resource "null_resource" "test" {
#   for_each = {for rg in var.resource_groups : rg.name => rg}

#   provisioner "local-exec" {
#     #command = "echo ${[for t in each.value.resource_sets : setunion(var.rg_type_set_map["${t}"])]}"
#     command = "echo ${flatten([for rs in each.value.resource_sets : setunion(var.rg_type_set_map["${rs}"])])}"
#   }
# }
output "test" {
  value =  [for rg in var.resource_groups : [for rs in rg.resource_sets : setunion(var.rg_type_set_map["${rs}"])]]
}