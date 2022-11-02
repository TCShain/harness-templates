## ID Variables
variable "env" {
    type    = string
    default = "hvm"
}

variable "name" {
    type = string
}


## Harness Variables
variable "account_id" {
    type = string
}

variable "api_key" {
    type = string
}

variable "hvm_path" {
    type = string
    default = "Setup/Template Library/Taylor Shain/HVM"
    description = "The target account's Template Library Path"
}