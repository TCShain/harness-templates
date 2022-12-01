# ## EXECUTION Variables
# variable "yaml_path" {
#   type    = string
#   default = "${path.root}/yaml"
# }

## API Variables
variable "harness_api_key" {
  type = string
}

variable "harness_account_id" {
  type = string
}

## TOP-LEVEL Variables
variable "org_name" {
  type    = string
  default = ""
}

variable "project_name" {
  type    = string
  default = ""
}

variable "level" {
  type = string
}

variable "reference_lab_tags" {
  type    = list(string)
  default = ["harness_template:reference_lab"]
}

## ENVIRONMENT Variables
variable "environments" {
}

## SERVICE Variables
variable "services" {
}

## CONNECTOR Variables
variable "connectors" {
  default = {
    "artifact_repository": {
        "name"       : "Docker Hub",
        "type"       : "DockerHub",
        "url"        : "https://registry.hub.docker.com/v2/"
        "user"       : "TCShain"
        "credentials": "account."
    },
    "source_repository": {
        "name": "reference_lab_env_2",
        "type": "Production"
    }
  }
}

## SECRET Variables
variable "secrets" {
  default = {
    "artifact_repository": {
        "name"       : "Docker Hub",
        "type"       : "DockerHub",
        "url"        : "https://registry.hub.docker.com/v2/"
        "user"       : "TCShain"
        "credentials": "account."
    },
    "two": {
        "name": "reference_lab_env_2",
        "type": "Production"
    }
  }
}

# RBAC Variables
## USER_GROUP Variables
variable "user_groups" {
}

## ROLE Variables
variable "roles" {
}

## ROLE_ASSIGNEMNT Variables
variable "role_assignments" {
}
