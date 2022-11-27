## API Variables
variable "harness_api_key" {
  type = string
}

variable "account_id" {
  type = string
}

## RESOURCE GROUP Type Set Variables
variable "rg_type_set_map" {
  default = {
    "ADMINISTRATIVE_FUNCTIONS" = [
      "RESOURCEGROUP",
      "SERVICEACCOUNT",
      "ROLE",
      "SETTING",
      "USER",
      "AUTHSETTING",
      "USERGROUP"
    ],
    "CHAOS" = [
      "CHAOS_HUB",
      "CHAOS_EXPERIMENT",
      "CHAOS_INFRASTRUCTURE",
      "CHAOS_GAMEDAY"
    ],
    "GITOPS" = [
      "GITOPS_CLUSTER",
      "GITOPS_AGENT",
      "GITOPS_CERT",
      "GITOPS_APP",
      "GITOPS_REPOSITORY",
      "GITOPS_GPGKEY"
    ],
    "ENVIRONMENT_GROUP" = [
      "ENVIRONMENT_GROUP"
    ]
    "SHARED_RESOURCES" = [
      "VARIABLE",
      "TEMPLATE",
      "FILE",
      "DASHBOARDS",
      "DEPLOYMENTFREEZE",
      "DELEGATECONFIGURATION",
      "SECRET",
      "DELEGATE"
    ],
    "SERVICE_RELIABILITY" = [
      "SLO",
      "MONITOREDSERVICE"
    ],
    "PIPELINES" = [
      "PIPELINE"
    ],
    "SERVICES" = [
      "SERVICE"
    ]
  }
}

variable "resource_sets" {
  default = [
    "ADMINISTRATIVE_FUNCTIONS",
    "CHAOS",
    "GITOPS",
    "ENVIRONMENT_GROUP",
    "SHARED_RESOURCES",
    "SERVICE_RELIABILITY",
    "PIPELINES",
    "SERVICES"
  ]
}