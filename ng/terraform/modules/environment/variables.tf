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

## ENVIRONMENT Variables
variable "environments" {
  type = list(object({
    name = string
    type = string
  }))
}