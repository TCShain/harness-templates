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
  type = list(object({
    name                 = string
    svc_type             = string
    artifact_source_type = string
  }))
}