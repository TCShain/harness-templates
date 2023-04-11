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
