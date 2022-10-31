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