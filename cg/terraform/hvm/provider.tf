terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

#Configure the Harness provider for First Gen resources
provider "harness" {
  endpoint   = "https://app.harness.io/gateway"
  account_id = var.account_id
  api_key    = var.api_key
}
