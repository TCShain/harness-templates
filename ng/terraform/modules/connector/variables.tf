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
  default = {
    "one": {
        "name": "reference_lab_env_1",
        "type": "PreProduction"
    },
    "two": {
        "name": "reference_lab_env_2",
        "type": "Production"
    }
  }
}