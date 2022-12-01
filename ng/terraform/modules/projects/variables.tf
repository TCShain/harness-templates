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
  type    = optional(list(string))
  default = ["harness_template:reference_lab"]
}


## PROJECT Variables
variable "description" {
  type = optional(string)
}
