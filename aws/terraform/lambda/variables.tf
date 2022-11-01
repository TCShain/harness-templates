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

variable "aws_access_key" {
    type = string
}

variable "aws_secret_key" {
    type = string
}

## Lambda Variables
variable "bucket" {
    type = string
}

variable "key" {
    type = string
}

variable "handler" {
    type    = string
    default = "index.handler"
}