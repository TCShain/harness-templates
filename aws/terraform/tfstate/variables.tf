## ID Variables
variable "namespace" {
    type = string
}

variable "stage" {
    type = string
}

variable "name" {
    type = string
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