resource "harness_yaml_config" "zip_lambda_svc" {
  path    = "Setup/Applications/Lab/Services/custom-lambda-zip/Index.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: SERVICE
artifactType: ZIP
deploymentType: CUSTOM
deploymentTypeTemplateUri: Taylor Shain/HVM/custom-lambda-artifact-only/custom_lambda_deployment
EOF
}

resource "harness_yaml_config" "zip_lambda_svc_artifact_source" {
  path    = "Setup/Applications/Lab/Services/custom-lambda-zip/s3_artifacts.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: AMAZON_S3
artifactPaths:
- lambda/code/*.zip
bucketName: tshain-harness-app-demo
serverName: tshain-sales-admin
EOF
}