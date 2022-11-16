# resource "harness_platform_usergroup" "rapid_user_group" {
#   identifier = "${var.user_group_name}_usrgrp"
#   name       = var.user_group_name

#   org_id     = harness_platform_organization.rapid_organization.id
#   project_id = var.project_name == "" ? null : var.project_name

#   tags       = var.rapid_lab_tags
  
#   notification_configs {
#     type        = "EMAIL"
#     group_email = var.user_group_email
#   }

# }

resource "harness_platform_resource_group" "rapid_resource_group" {
  for_each = var.resource_groups

  identifier = "${each.value.name}"
  name       = "${each.value.name}"
  tags       = var.rapid_lab_tags

  org_id     = each.value.org_id == "" ? null : each.value.org_id
  project_id = each.value.project_id == "" ? null : each.value.project_id

  account_id = var.account_id

  allowed_scope_levels = each.value.allowed_scope_levels

  included_scopes {
    #filter     = "EXCLUDING_CHILD_SCOPES"
    filter     = "INCLUDING_CHILD_SCOPES"
    account_id = var.account_id
    org_id     = each.value.org_id == "" ? null : each.value.org_id
    project_id = each.value.project_id == "" ? null : each.value.project_id
  }

  # resource_filter {
  #   include_all_resources = false
  #   resources {
  #     resource_type = "ENVIRONMENT"
  #     #identifiers   = ["rapid_lab_env_1"]
  #     attribute_filter {
  #       attribute_name   = "type"
  #       attribute_values = ["Production"]
  #       #attribute_values = ["Production"]
  #       #attribute_values = ["tcshaindockerhub"]
  #     }
  #   }
  # }
    resource_filter {
    include_all_resources = false
    resources {
      resource_type = each.value.resource_type
      identifiers   = each.value.ids
      # attribute_filter {
      #   attribute_name   = each.value.attribute_name == "" ? null : each.value.attribute_name
      #   attribute_values = [each.value.attribute_values == "" ? null : each.value.attribute_values]
      #   #attribute_values = ["Production"]
      #   #attribute_values = ["tcshaindockerhub"]
      # }
    }
  }

}