## ID Variables
variable "env" {
  type    = string
  default = "dev"
}

variable "infra" {
  type    = string
  default = "lambda"
}

variable "svc" {
  type    = string
  default = "custom-lambda-zip"
}

### Temporary svc name:
variable "svc_c" {
  type    = string
  default = "custom-lambda-container"
}

## AWS Variables
variable "region" {
  type        = string
  description = "AWS region"
  default     = "ca-central-1"
}

# variable "aws_access_key" {
#     type = string
# }

# variable "aws_secret_key" {
#     type = string
# }

## Lambda Variables
variable "image_uri" {
    type    = string
    default = "759984737373.dkr.ecr.ca-central-1.amazonaws.com/tshain-ecr:latest"
}

variable "bucket" {
    type    = string
    default = "tshain-harness-app-demo"
}

variable "key" {
    type    = string
    default = "lambda/code/democode_v2.zip"
}

variable "handler" {
    type    = string
    default = "index.handler"
}