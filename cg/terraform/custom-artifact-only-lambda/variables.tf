## ID Variables
variable "env" {
    type    = string
    default = "hvm"
}

variable "name" {
    type        = string
    description = "Name of the Custom Deployment Type"
    default     = "custom-lambda-artifact-only"
}


## Harness Variables
variable "account_id" {
    type = string
}

variable "api_key" {
    type = string
}

variable "harness_path" {
    type = string
    default = "Setup/Template Library/Taylor Shain/HVM"
    description = "The target account's Template Library Path"
}

variable "short_harness_path" {
    type = string
    default = "Taylor Shain/HVM"
    description = "The short path to the target account's Template Library Path"
}