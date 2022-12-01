resource "harness_platform_usergroup" "reference_user_group" {
  for_each = {for ug in var.user_groups: ug.name => ug }
  
  identifier = each.value.name
  name       = each.value.name
  org_id     = var.org_name == "" ? null : var.org_name
  project_id = var.project_name == "" ? null : var.project_name
  tags       = var.reference_lab_tags

  linked_sso_display_name = each.value.linked_sso_display_name
  sso_group_id            = each.value.sso_group_name
  sso_group_name          = each.value.sso_group_name
  linked_sso_type         = each.value.linked_sso_type
  sso_linked              = each.value.sso_linked
  
  dynamic notification_configs {
    for_each = {for nc in each.value.notification_configs: nc.type => nc}
    content {
      type                        = notification_configs.value.type
      group_email                 = notification_configs.value.group_email
      microsoft_teams_webhook_url = notification_configs.value.microsoft_teams_webhook_url
      pager_duty_key              = notification_configs.value.pager_duty_key
      slack_webhook_url           = notification_configs.value.slack_webhook_url
    }
  }
}