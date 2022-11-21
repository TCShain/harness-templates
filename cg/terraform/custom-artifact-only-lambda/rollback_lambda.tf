resource "harness_yaml_config" "rollback_svc_cmd" {
  path    = "${var.harness_path}/${var.name}/rollback_lambda.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: SSH
commandUnitType: OTHER
commandUnits:
- command: |-
    export AWS_ACCESS_KEY_ID=AKIA3B4U6ZROQD4UWXP3
    export AWS_SECRET_ACCESS_KEY=$${secrets.getValue("tshain-aws-sales-admin-secret-key")}

    RESULT=$(aws lambda update-function-code --function-name $${env.name}-$${infra.name}-$${service.name}-lambda --region $${infra.custom.vars.region} --s3-bucket=$${rollbackArtifact.bucketName} --s3-key=$${rollbackArtifact.key})

    echo "\nComplete.  Function details:"
    echo "-------------------------------\n"

    echo "$RESULT" > output.txt
    for i in FunctionName FunctionArn Role Handler MemorySize CodeSha256
    do
      echo "\n$i: " $(cat output.txt | jq .$i)
    done

    echo "\n\n-------------------------------"
    echo "Lambda Function Rollback: Success\n\n"
  commandUnitType: EXEC
  deploymentType: SSH
  name: Rollback Lambda
  scriptType: BASH
EOF
}