# resource "harness_platform_usergroup" "rapid_user_group" {
#   identifier = "${var.user_group_name}_usrgrp"
#   name       = var.user_group_name
#   org_id     = harness_platform_organization.rapid_organization.id
#   project_id = harness_platform_project.rapid_project.id
#   tags       = var.rapid_lab_tags
  
#   notification_configs {
#     type        = "EMAIL"
#     group_email = var.user_group_email
#   }
# }
