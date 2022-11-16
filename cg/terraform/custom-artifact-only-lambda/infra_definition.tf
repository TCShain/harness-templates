# resource "harness_yaml_config" "test" {
#   path    = "Setup/Applications/Lab/Environments/dev/Infrastructure Definitions/lambda-nonprd-tf.yaml"
#   content = <<EOF
# harnessApiVersion: '1.0'
# type: INFRA_DEFINITION
# cloudProviderType: CUSTOM
# deploymentType: CUSTOM
# deploymentTypeTemplateUri: "Taylor Shain/AWS Lambda Artifact"
# infrastructure:
# - type: CUSTOM
#   infraVariables:
#   - name: region
#     value: us-east-1
# EOF
# }

# Setup/Applications/cloud-surf/Environments/dev/Infrastructure Definitions/awa-demo-infra.yaml
# Setup/Applications/Lab/Environments/dev/Infrastructure Definitions/lambda-nonprd-tf.yaml

resource "harness_infrastructure_definition" "custom_lambda" {
  name                = "${var.name}-custom-lambda"
  app_id              = "3sUo-L_OSO-JHOJ_xwfn9Q"
  env_id              = "_GyUFsXkRrKG6DI2TG8-bQ"
  cloud_provider_type = "CUSTOM"
  deployment_type     = "Custom"
  
  deployment_template_uri = "Taylor Shain/HVM/custom-lambda-artifact-only/custom_lambda_deployment"
  
#   custom {
#     region = "ca-central-1"
#   }

}