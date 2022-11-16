resource "harness_platform_organization" "rapid_organization" {
  name        = var.org_name
  identifier  = var.org_name
  description = "Rapid Lab Harness Template Organization"
  tags        = var.rapid_lab_tags

}

resource "harness_platform_project" "rapid_project" {
  name        = var.project_name
  identifier  = var.project_name
  org_id      = harness_platform_organization.rapid_organization.id
  description = "Rapid Lab Harness Template Project"
  tags        = var.rapid_lab_tags

}

# module "secrets" {
#   source = "../modules/secret"
  
#   org_name       = harness_platform_organization.rapid_organization.id
#   project_name   = harness_platform_project.rapid_project.id
#   rapid_lab_tags = var.rapid_lab_tags
  
#   secrets        = var.secrets

# }

module "environments" {
  source = "../modules/environment"
  
  org_name       = harness_platform_organization.rapid_organization.id
  project_name   = harness_platform_project.rapid_project.id
  rapid_lab_tags = var.rapid_lab_tags
  
  environments = var.environments

}

module "services" {
  source = "../modules/service"
  
  org_name       = harness_platform_organization.rapid_organization.id
  project_name   = harness_platform_project.rapid_project.id
  rapid_lab_tags = var.rapid_lab_tags
  
  services = var.services

}

## RESOURCE_GROUP Variables
variable "resource_groups" {
  default = {
    # "one": {
    #     "name"      : "rapid_lab_rg_1",
    #     "org_id"    : "rapid_org"
    #     "project_id": ""
    #     "allowed_scope_levels": ["organization"]
    # },
    "two": {
        "name"      : "rapid_lab_rg_2",
        "org_id"    : "rapid_org",
        "project_id": "rapid_project",
        "allowed_scope_levels": ["project"],
        "resource_type": "ENVIRONMENT",
        "ids": ["rapid_lab_env_1"]
    }
  }
}

# variable "attribute_filter" {
#   type = object({
#     attribute_name = string
#     attribute_values = list(string)
#   })
#   default = null
# }

module "resource_groups" {
  source     = "../modules/rbac/resource_group"
  depends_on = [
    module.environments
  ]
  
  org_name       = harness_platform_organization.rapid_organization.id
  project_name   = harness_platform_project.rapid_project.id
  rapid_lab_tags = var.rapid_lab_tags

  account_id = var.harness_account_id
  
  resource_groups = var.resource_groups

}