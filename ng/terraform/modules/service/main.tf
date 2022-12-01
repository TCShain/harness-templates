resource "harness_platform_service" "reference_service" {
  for_each = {for svc in var.services: svc.name => svc}

  name        = each.value.name
  identifier  = each.value.name
  org_id      = var.org_name
  project_id  = var.project_name
  description = "Harness Service"
  tags        = var.reference_lab_tags

  yaml = templatefile("${path.module}/svc_templates/${each.value.svc_type}_svc.tftpl",
    {
      name = each.value.name,
      as_type = each.value.artifact_source_type
    }
  )
  
}

