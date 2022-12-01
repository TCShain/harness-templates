## TOP-LEVEL Variables
variable "org_name" {
  type    = string
  default = "reference_org"
}

variable "project_name" {
  type    = string
  default = "reference_project"
}

variable "reference_lab_tags" {
  type    = list(string)
  default = ["harness_template:reference_lab"]
}

variable "account_id" {
  type    = string
  default = ""
}

## ROLE_ASSIGNMENT Variables
variable "role_assignments" {
  type = list(object({
    identifier                = string
    org_id                    = optional(string)
    project_id                = optional(string)
    resource_group_identifier = optional(string)
    role_identifier           = optional(string)
    disabled                  = optional(string)
    managed                   = optional(string)
    principal                 = list(object({
      type        = string
      identifier  = string
      scope_level = optional(string)
    }))
  }))
}