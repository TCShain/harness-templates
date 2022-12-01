resource "random_shuffle" "color" {
  input        = ["#008000", "#800080", "#FF0000", "#0000FF", "#808080", "#F0F8FF", "#FF7F50", "#B22222", "#FF69B4", "#FFFACD"]
  result_count = 1
}

resource "harness_platform_project" "reference_project" {
  org_id      = var.org_name
  name        = var.project_name    
  identifier  = var.project_name
  color       = random_shuffle.color.result
  description = var.description
}