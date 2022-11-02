## Cloud Providers and Connectors
module "use_case_library_repo" {
    source = "github.com/TCShain/harness-templates.git//cg/terraform/modules/connectors/public_git_repo?ref=main"

    # account_id         = var.account_id
    # api_key            = var.api_key
    name               = var.name
    #env               =
    #use_case_repo_url =
    #branch            =
}

resource "harness_cloudprovider_datacenter" "use_case_library_cp" {
  name = "HVM-Cloud-Provider"
}

## Application Resources
resource "harness_application" "use_case_library_app" {
  name = "HVM-${var.name}"
}

# Service
resource "harness_service_kubernetes" "use_case_library_svc" {
  app_id = harness_application.use_case_library_app.id
  name   = "HVM"
}

# Environment
resource "harness_environment" "use_case_library_env" {
  app_id = harness_application.use_case_library_app.id
  name   = "Execute"
  type   = "NON_PROD"
}

resource "harness_infrastructure_definition" "k8s" {
  name                = "SSH"
  app_id              = harness_application.use_case_library_app.id
  env_id              = harness_environment.use_case_library_env.id
  cloud_provider_type = "PHYSICAL_DATA_CENTER"
  deployment_type     = "SSH"

  datacenter_ssh {
    cloud_provider_name             = harness_cloudprovider_datacenter.use_case_library_cp.name
    host_connection_attributes_name = "dev"
    hostnames                       = ["localhost"]
  }
}

resource "tls_private_key" "harness_hvm_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

data "harness_secret_manager" "secret_manager" {
  default = true
}

resource "harness_encrypted_text" "hvm_secret" {
  name              = "HVM-Secret"
  value             = tls_private_key.harness_hvm_key.private_key_pem
  secret_manager_id = data.harness_secret_manager.secret_manager.id
}

resource "harness_ssh_credential" "ssh_creds" {
  name = "HVM-SSH-Creds"

  ssh_authentication {
    port     = 22
    username = "git"
    inline_ssh {
      ssh_key_file_id = harness_encrypted_text.hvm_secret.id
    }
  }

  // This is a workaround until https://harness.atlassian.net/browse/PL-17967 is resolved
  // The graphql API currently doesn't return all the fields in the query.
#   lifecycle {
#     ignore_changes = ["ssh_authentication"]
#   }
}