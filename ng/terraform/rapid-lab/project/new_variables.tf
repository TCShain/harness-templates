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

variable "rapid_lab_tags" {
  type    = list(string)
  default = ["harness_template:rapid_lab"]
}

## USER_GROUP Variables
variable "user_group_name" {
  type    = string
  default = "rapid_user_group"
}

variable "user_group_email" {
  type    = string
  default = "user_group@email.com"
}

## RESOURCE_GROUP Variables
variable "resource_group_name" {
  type    = string
  default = "rapid_resource_group"
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
        "name": "rapid_lab_env_2",
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
        "name": "rapid_lab_env_2",
        "type": "Production"
    }
  }
}

# RBAC Variables
## RESOURCE_GROUP Variables
variable "resource_groups" {
}

## USER_GROUP Variables
variable "user_groups" {
}

## ROLE Variables
variable "roles" {
}

## ROLE_ASSIGNEMNT Variables
variable "role_assignments" {
}