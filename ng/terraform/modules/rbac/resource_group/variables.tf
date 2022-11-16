## TOP-LEVEL Variables
variable "org_name" {
  type    = string
  default = "rapid_org"
}

variable "project_name" {
  type    = string
  default = "rapid_project"
}

variable "rapid_lab_tags" {
  type    = list(string)
  default = ["harness_template:rapid_lab"]
}

variable "account_id" {
  type    = string
  default = ""
}

# ## USER_GROUP Variables
# variable "user_groups" {
#   default = {
#     "one": {
#         "name": "rapid_lab_env_1",
#         "type": "PreProduction"
#     },
#     "two": {
#         "name": "rapid_lab_env_2",
#         "type": "Production"
#     }
#   }
# }

## RESOURCE_GROUP Variables
# variable "resource_groups" {
#   default = {
#     # "one": {
#     #     "name"      : "rapid_lab_rg_1",
#     #     "org_id"    : "rapid_org"
#     #     "project_id": ""
#     #     "allowed_scope_levels": ["org"]
#     # },
#     "two": {
#         "name"      : "rapid_lab_rg_2",
#         "org_id"    : "rapid_org",
#         "project_id": "rapid_project",
#         "allowed_scope_levels": ["project"]
#     }
#   }
# }

variable "resource_groups" {
}