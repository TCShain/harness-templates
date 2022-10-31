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

## Network Variables
variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones where subnets will be created"
}

variable "cidr_block" {
    type        = string
    description = "VPC CIDR Block"
}
