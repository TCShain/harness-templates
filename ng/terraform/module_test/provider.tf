terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

provider "harness" {
  endpoint            = "https://app.harness.io/gateway"
  account_id          = var.account_id
  platform_api_key    = var.harness_api_key
}