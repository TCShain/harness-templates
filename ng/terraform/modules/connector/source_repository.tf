## Source Repository
resource "harness_platform_connector_github" "Github" {
  identifier      = "Github"
  name            = "Github"
  url             = "https://github.com"
  connection_type = "Account"
  validation_repo = "rssnyder/test"

  api_authentication {
    token_ref = "account.gh_pat"
  }

  credentials {
    http {
      username  = "rssnyder"
      token_ref = "account.gh_pat"
    }
  }
}