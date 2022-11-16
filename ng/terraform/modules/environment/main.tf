resource "harness_platform_environment" "rapid_environment" {
  #for_each = {for index, env in var.environment_names: env.name => env}
  for_each = var.environments

  name        = "${each.value.name}"
  identifier  = "${each.value.name}"
  org_id      = var.org_name
  project_id  = var.project_name
  type        = "${each.value.type}"
  description = "Rapid Lab Harness Template Environment"
  tags        = var.rapid_lab_tags
  
}