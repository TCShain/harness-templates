resource "harness_yaml_config" "custom_deployment_template" {
  path    = "${var.hvm_path}/${var.name}/custom_deployment.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: CUSTOM_DEPLOYMENT_TYPE
fetchInstanceScript: |-
  export AWS_ACCESS_KEY_ID=AKIA3B4U6ZROQD4UWXP3
  export AWS_SECRET_ACCESS_KEY=$${secrets.getValue("tshain-aws-sales-admin-secret-key")}

  echo "[" > $${INSTANCE_OUTPUT_PATH}
  aws lambda get-function --function-name $${env.name}-$${infra.name}-$${service.name}-lambda --region $${infra.custom.vars.region} >> $${INSTANCE_OUTPUT_PATH}
  echo "]" >> $${INSTANCE_OUTPUT_PATH}

  echo "---------------------------------------------"

  cat $${INSTANCE_OUTPUT_PATH}
hostAttributes:
  hostname: Configuration.FunctionName
hostObjectArrayPath: $
variables:
- description: AWS Region
  name: region
EOF
}