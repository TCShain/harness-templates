resource "harness_yaml_config" "docker_lambda_svc" {
  path    = "Setup/Applications/Lab/Services/custom-lambda-docker/Index.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: SERVICE
artifactType: DOCKER
deploymentType: CUSTOM
deploymentTypeTemplateUri: Taylor Shain/HVM/custom-lambda-artifact-only/custom_lambda_deployment
EOF
}

resource "harness_yaml_config" "docker_lambda_svc_artifact_source" {
  path    = "Setup/Applications/Lab/Services/custom-lambda-docker/ecr_artifacts.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: ECR
imageName: tshain-ecr
region: ca-central-1
serverName: tshain-sales-admin
EOF
}

