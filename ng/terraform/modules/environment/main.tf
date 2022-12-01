resource "harness_platform_environment" "reference_environment" {
  for_each = {for env in var.environments: env.name => env}

  name        = each.value.name
  identifier  = each.value.name
  org_id      = var.org_name
  project_id  = var.project_name
  type        = each.value.type
  description = "Rapid Lab Harness Template Environment"
  tags        = var.reference_lab_tags
  
}