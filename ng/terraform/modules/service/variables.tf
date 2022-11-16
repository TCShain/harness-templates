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

## SERVICE Variables
variable "services" {
  default = {
    "one": {
        "name": "rapid_lab_svc_1",
        "type": "PreProduction"
    },
    "two": {
        "name": "rapid_lab_svc_2",
        "type": "Production"
    }
  }
}