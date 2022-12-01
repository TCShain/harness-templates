## DockerHub dummy Secret Text
resource "harness_platform_secret_text" "dockerhub_secret" {
  identifier  = "${var.org_name}_dockerhub_secret"
  name        = "${var.org_name}_dockerhub_secret"
  description = "Dummy Secret used for DockerHub connections"
  tags        = var.reference_lab_tags

  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = "secret"

}

## GitHub dummy Secret Text
resource "harness_platform_secret_text" "github_secret" {
  identifier  = "${var.org_name}_github_secret"
  name        = "${var.org_name}_github_secret"
  description = "Dummy Secret used for GitHub connections"
  tags        = var.reference_lab_tags

  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = "secret"
  
}