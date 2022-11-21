## TOP-LEVEL Variables
variable "org_name" {
  type    = string
  default = ""
}

variable "project_name" {
  type    = string
  default = ""
}

variable "rapid_lab_tags" {
  type    = list(string)
  default = ["harness_template:rapid_lab"]
}

variable "account_id" {
  type    = string
  default = ""
}

variable "level" {
  type = string
}

# RESOURCE_GROUP Variables
variable "resource_groups" {
  type = list(object({
    name                 = string
    description          = optional(string)
    org_id               = optional(string)
    project_id           = optional(string)
    scope_filter         = string
    allowed_scope_levels = optional(list(string))
    resources            = list(object({
      resource_type    = string
      identifiers      = optional(list(string))
      attribute_filter = optional(list(object({
        attribute_name   = optional(string)
        attribute_values = optional(list(string))
      })))
    }))
  }))
}