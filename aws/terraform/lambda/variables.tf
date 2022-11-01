## ID Variables
variable "env" {
    type = string
}

variable "infra" {
    type = string
}

variable "svc" {
    type = string
}

## AWS Variables
variable "region" {
  type        = string
  description = "AWS region"
}