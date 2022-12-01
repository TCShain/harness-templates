## API Variables
variable "harness_api_key" {
  type = string
}

variable "harness_account_id" {
  type = string
}

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

## USER_GROUP Variables
variable "user_groups" {
  default = [
    {
      "name"      : "example",
      "org_id"    : "example",
      "project_id": "example",
      "notification_configs": [
        {
          "type": "EMAIL",
          "group_email": "example"
        }
      ]
    }
  ]
}

# ## ROLE Variables
# variable "roles" {
#   default = [
#     {
#       "identifier"          : "reference_role_1",
#       "name"                : "reference_role_1",
#       "org_id"              : "reference_org",
#       "project_id"          : "reference_project",
#       "description"         : "example tf created role"
#       "permissions"         : ["core_pipeline_edit"]
#       "allowed_scope_levels": ["project"]
#     },
#     {
#       "identifier"          : "reference_role_2",
#       "name"                : "reference_role_2",
#       "org_id"              : "reference_org",
#       "description"         : "example tf created role"
#       "permissions"         : ["core_user_view"]
#       "allowed_scope_levels": ["project"]
#     }
#   ]
# }

# # ## ROLE_ASSIGNEMNT Variables
# # variable "role_assignments" {
# #   default = [{
# #     identifier = "reference_lab_role_assignment_1"
# #     org_id     = "reference_org"
# #     project_id = "reference_project"
# #     principal  = {
# #       type       = "USER_GROUP"
      
# #     }
# #   }]
# # }