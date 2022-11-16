## Cloud Providers
resource "harness_platform_connector_aws" "sales" {
  identifier = "sales"
  name       = "sales"

  manual {
    access_key     = "AKIA3B4U6ZRO63H37QA3"
    secret_key_ref = "account.salesadminkey"
  }
}