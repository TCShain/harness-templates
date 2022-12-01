## TOP-LEVEL Variables
variable "org_name" {
  type    = string
  default = ""
}

variable "project_name" {
  type    = string
  default = ""
}

variable "reference_lab_tags" {
  type    = list(string)
  default = ["harness_template:reference_lab"]
}

variable "account_id" {
  type    = string
  default = ""
}

## USER_GROUP Variables
variable "user_groups" {
  type = list(object({
    name                    = string
    org_id                  = optional(string)
    project_id              = optional(string)
    linked_sso_display_name = optional(string)
    sso_group_name          = optional(string)
    linked_sso_type         = optional(string)
    sso_linked              = optional(string)
    notification_configs    = optional(list(object({
      type                        = string
      group_email                 = optional(string)
      microsoft_teams_webhook_url = optional(string)
      pager_duty_key              = optional(string)
      slack_webhook_url           = optional(string)
    })))
  }))
}