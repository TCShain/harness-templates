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
  default = "rapid_org"
}

variable "project_name" {
  type    = string
  default = "rapid_project"
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
  default = {
    "one": {
        "name": "rapid_lab_env_1",
        "type": "PreProduction"
    },
    "two": {
        "name": "rapid_lab_env_2",
        "type": "Production"
    }
  }
}

## SERVICE Variables
variable "services" {
  default = {
    "one": {
        "name": "rapid_lab_env_1",
        "type": "PreProduction"
    },
    "two": {
        "name": "rapid_lab_env_2",
        "type": "Production"
    }
  }
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