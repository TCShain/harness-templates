data "harness_secret_manager" "default" {
  default = true
}

resource "harness_encrypted_text" "anonymous_key" {
  name              = "${var.env}-${var.name}-anonymous-key"
  value             = "bar"
  secret_manager_id = data.harness_secret_manager.default.id
}

resource "harness_git_connector" "example" {
  name                 = "${var.name}-Public-Repo"
  url                  = var.use_case_repo_url
  branch               = var.branch
  generate_webhook_url = false
  password_secret_id   = harness_encrypted_text.anonymous_key.id
  url_type             = "REPO"
  username             = "foo"
}