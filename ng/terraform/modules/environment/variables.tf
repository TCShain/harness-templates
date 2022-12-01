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

## ENVIRONMENT Variables
variable "environments" {
  type = list(object({
    name = string
    type = string
  }))
}