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