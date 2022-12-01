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

## SERVICE Variables
variable "services" {
  type = list(object({
    name                 = string
    svc_type             = string
    artifact_source_type = string
  }))
}