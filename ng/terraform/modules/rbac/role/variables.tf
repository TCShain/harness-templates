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

## ROLE Variables
variable "roles" {
  type = list(object({
    identifier           = string
    name                 = string
    org_id               = optional(string)
    project_id           = optional(string)
    description          = optional(string)
    permissions          = list(string)
    allowed_scope_levels = list(string)
  }))
}