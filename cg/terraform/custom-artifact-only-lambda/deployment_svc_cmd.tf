resource "harness_yaml_config" "deployment_svc_cmd" {
  path    = "${var.hvm_path}/${var.name}/deployment_svc_cmd.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: SSH
commandUnitType: OTHER
commandUnits:
- command: |2-

    # Execute as root and pass environment variables
    # su -p -

    # Execute as root via user credentials (with root privileges)
    # sudo -E su -p -

    # The following variables are absolute paths defined as:
    # $${HOME}/$${appName}/$${serviceName}/$${serviceTemplateName}/[runtime|backup|staging]

    mkdir -p "$WINGS_RUNTIME_PATH"
    mkdir -p "$WINGS_BACKUP_PATH"
    mkdir -p "$WINGS_STAGING_PATH"
  commandUnitType: SETUP_ENV
  deploymentType: SSH
  name: Initialize
  scriptType: BASH
- command: "echo \"-------------\"\n\necho \"Bucket Name: \" $${artifact.bucketName}\necho \"Path: \" $${artifact.artifactPath}\necho \"Full Name: \" $${artifact.buildFullDisplayName}\necho \"Build No: \" $${artifact.buildNo}\necho \"Key: \" $${artifact.key} \necho \"File Name:\" $${artifact.fileName}\n#echo \"Label: \" $${artifact.label}\n\necho \"-------------\"\n\necho \"Region: \" $${region}"
  commandUnitType: EXEC
  deploymentType: SSH
  name: Diag
  scriptType: BASH
- command: |-
    export AWS_ACCESS_KEY_ID=AKIA3B4U6ZROQD4UWXP3
    export AWS_SECRET_ACCESS_KEY=$${secrets.getValue("tshain-aws-sales-admin-secret-key")}

    RESULT=$(aws lambda update-function-code --function-name $${env.name}-$${infra.name}-$${service.name}-lambda --region $${infra.custom.vars.region} --s3-bucket=$${artifact.bucketName} --s3-key=$${artifact.key})

    echo "\nComplete.  Function details:"
    echo "-------------------------------\n"

    echo "$RESULT" > output.txt
    for i in FunctionName FunctionArn Role Handler MemorySize CodeSha256
    do
      echo "\n$i: " $(cat output.txt | jq .$i)
    done

    echo "\n\n-------------------------------"
    echo "Lambda Function Deployment: Success\n\n"
  commandUnitType: EXEC
  deploymentType: SSH
  name: Update Function Artifact
  scriptType: BASH
variables:
- name: RUNTIME_PATH
EOF
}