## ID Variables
variable "namespace" {
    type = string
    default = "demo"
}

variable "stage" {
    type = string
    default = "stage"
}

variable "name" {
    type = string
    default = "app"
}

## AWS Variables
variable "region" {
  type        = string
  description = "AWS region"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key from Harness Pipeline input"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key from Harness Pipeline input"
}
