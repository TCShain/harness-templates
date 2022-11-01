## ID Variables
variable "env" {
    type    = string
    default = "hvm"
}

variable "name" {
    type = string
}


# ## Harness Variables
# variable "account_id" {
#     type = string
# }

# variable "api_key" {
#     type = string
# }


## Git Repo Variables
variable "use_case_repo_url" {
    type    = string
    default = "https://github.com/TCShain/harness-templates.git"
}

variable "branch" {
    type    = string
    default = "main"
}