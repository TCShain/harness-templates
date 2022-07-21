variable "harness_account_id" {
  type = string
}

variable "harness_api_key" {
  type = string
}

variable "rapid_lab_tag" {
  type    = string
  default = "harness_template:rapid_lab"
}

variable "project_name" {
  type = string
}

variable "project_identifier" {
  type = string
}

variable "org_id" {
  type    = string
  default = "default"
}

variable "environment_name" {
  type    = string
  default = "lab"
}

variable "environment_identifier" {
  type    = string
  default = "lab"
}

variable "environment_type" {
  type    = string
  default = "PreProduction"
}

variable "service_name" {
  type    = string
  default = "lab_service"
}

variable "service_identifier" {
  type    = string
  default = "lab_service"
}