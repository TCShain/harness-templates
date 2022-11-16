## Artifact Repository
resource "harness_platform_connector_docker" "dockerhub" {
  for_each = var.connectors

  identifier = each.value.name
  name       = "${each.value.name}"
  type       = each.value.type
  url        = each.value.url

  org_id     = var.org_name == "" ? null : var.org_name
  project_id = var.project_name == "" ? null : var.project_name

  credentials {
    username     = "rileysnyderharnessio"
    password_ref = "account.dockerhub"
  }

}

resource "harness_platform_connector_artifactory" "harnessartifactory" {
  identifier = "harnessartifactory"
  name       = "harness-artifactory"
  url        = "https://harness.jfrog.io/artifactory/"

  org_id     = var.org_name == "" ? null : var.org_name
  project_id = var.project_name == "" ? null : var.project_name

}
