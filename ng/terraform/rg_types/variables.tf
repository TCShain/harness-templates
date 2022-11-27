## API Variables

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

variable "rg_types" {
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

variable "resource_groups" {
  type = list(object({
    name                 = string
    description          = optional(string)
    org_id               = optional(string)
    project_id           = optional(string)
    scope_filter         = string
    allowed_scope_levels = optional(list(string))
    resource_sets        = optional(list(string))
    resources            = list(object({
      resource_type    = string
      identifiers      = optional(list(string))
      attribute_filter = optional(list(object({
        attribute_name   = optional(string)
        attribute_values = optional(list(string))
      })))
    }))
  }))
}