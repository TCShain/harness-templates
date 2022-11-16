resource "harness_yaml_config" "lambda_workflow" {
  path    = "Setup/Applications/Lab/Workflows/custom-lambda-deploy.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: BASIC
concurrencyStrategy: INFRA
envName: dev
failureStrategies:
- executionScope: WORKFLOW
  failureTypes:
  - APPLICATION_ERROR
  - CONNECTIVITY
  - VERIFICATION_FAILURE
  - AUTHENTICATION
  repairActionCode: ROLLBACK_WORKFLOW
  retryCount: 0
phases:
- type: CUSTOM
  computeProviderName: DUMMY_CLOUD_PROVIDER
  daemonSet: false
  infraDefinitionName: lambda-ca-central-1
  name: Phase 1
  phaseSteps:
  - type: CUSTOM_DEPLOYMENT_PHASE_STEP
    name: Deploy Terraform
    stepSkipStrategies:
    - assertionExpression: $${workflow.variables.skip_tf}=="true"
      scope: SPECIFIC_STEPS
      steps:
      - Terraform Apply
      - Terraform Plan
    - assertionExpression: $${workflow.variables.skip_approval}=="true"
      scope: SPECIFIC_STEPS
      steps:
      - Approval
    steps:
    - type: TERRAFORM_APPLY
      name: Terraform Plan
      properties:
        backendConfigs:
        - name: secret_key
          valueType: ENCRYPTED_TEXT
          value: gcpkms:tshain-cli-sales-admin-secret-key
        - name: access_key
          valueType: TEXT
          value: AKIA3B4U6ZROQD4UWXP3
        - name: region
          valueType: TEXT
          value: $${infra.custom.vars.region}
        - name: key
          valueType: TEXT
          value: tfstate/$${env.name}/$${infra.name}/$${service.name}
        - name: bucket
          valueType: TEXT
          value: tshain-harness-app-demo
        delegateTag: ''
        environmentVariables: null
        exportPlanToApplyStep: false
        exportPlanToHumanReadableOutput: false
        inheritApprovedPlan: false
        name: Terraform Plan
        provisionerName: Lambda Infra Deployment
        runPlanOnly: true
        targets: null
        templateUuid: null
        templateVariables: null
        templateVersion: null
        tfVarFiles: ''
        tfVarGitFileConfig: null
        timeoutMillis: 300000
        variables:
        - name: aws_secret_key
          valueType: ENCRYPTED_TEXT
          value: gcpkms:tshain-cli-sales-admin-secret-key
        - name: aws_access_key
          valueType: TEXT
          value: AKIA3B4U6ZROQD4UWXP3
        - name: key
          valueType: TEXT
          value: $${artifact.key}
        - name: bucket
          valueType: TEXT
          value: $${artifact.bucketName}
        - name: infra
          valueType: TEXT
          value: $${infra.name}
        - name: env
          valueType: TEXT
          value: $${env.name}
        - name: svc
          valueType: TEXT
          value: $${service.name}
        - name: region
          valueType: TEXT
          value: $${infra.custom.vars.region}
        workspace: ''
    - type: APPROVAL
      name: Approval
      properties:
        approvalStateType: USER_GROUP
        timeoutMillis: 86400000
        userGroupNames:
        - Account Administrator
    - type: TERRAFORM_APPLY
      name: Terraform Apply
      properties:
        delegateTag: ''
        exportPlanToApplyStep: false
        exportPlanToHumanReadableOutput: false
        inheritApprovedPlan: true
        name: Terraform Apply
        provisionerName: Lambda Infra Deployment
        runPlanOnly: false
        tfVarFiles: ''
        tfVarGitFileConfig: null
        timeoutMillis: 300000
        workspace: ''
    stepsInParallel: false
  - type: CUSTOM_DEPLOYMENT_PHASE_STEP
    name: Deploy
    stepSkipStrategies:
    - assertionExpression: $${workflow.variables.skip_lambda_deploy}==true
      scope: ALL_STEPS
    steps:
    - type: CUSTOM_DEPLOYMENT_FETCH_INSTANCES
      name: Fetch Instances
      properties:
        stateTimeoutInMinutes: 1
    - type: SHELL_SCRIPT
      name: Diag
      properties:
        commandPath: null
        connectionAttributeName: null
        executeOnDelegate: true
        host: null
        outputVars: ''
        publishAsVar: false
        scriptString: |-
          ## Sanitize Service Variables
          echo "" > vars
          for i in $${serviceVariable}
          do
              echo $i | sed s'/[{,}]//g' >> vars
          done

          cat vars | jq -R -s 'split("\n") | map(select(length > 0)) | map(select(startswith("#") | not)) | map(split("=")) | map({(.[0]): .[1]}) | add' > svc_vars.json

          echo "\nService Variables:"
          echo "----------------------\n"
          cat svc_vars.json

          ## Sanitize Service Variables
          echo "" > vars
          for i in $${instance.host.properties.envvars}
          do
             echo $i | sed s'/[{,}]//g' >> vars
          done

          cat vars

          cat vars | jq -R -s 'split("\n") | map(select(length > 0)) | map(select(startswith("#") | not)) | map(split(":")) | map({(.[0]): .[1]}) | add' > fetched_vars.json

          jq -s '.[0] * .[1]' fetched_vars.json svc_vars.json

          echo "\nFetched Variables:"
          echo "----------------------\n"
          cat fetched_vars.json
        scriptType: BASH
        sshKeyRefName: null
        sweepingOutputName: null
        sweepingOutputScope: null
        templateExpressions: null
        templateUuid: null
        templateVariables: null
        templateVersion: null
        timeoutMillis: 60000
    - type: COMMAND
      name: Deploy Lambda Artifact
      properties:
        commandName: deploy_lambda
        commandType: OTHER
        connectionAttributeName: null
        executeOnDelegate: true
        host: null
        outputVars: ''
        publishAsVar: false
        sshKeyRefName: null
        sweepingOutputName: null
        sweepingOutputScope: null
        templateExpressions: null
        timeoutMillis: 60000
      templateUri: "${var.short_harness_path}/${var.name}/deploy_lambda:latest"
      templateVariables:
      - name: RUNTIME_PATH
    stepsInParallel: false
  - type: CUSTOM_DEPLOYMENT_PHASE_STEP
    name: Verify Service
    stepSkipStrategies:
    - assertionExpression: 'true'
      scope: SPECIFIC_STEPS
      steps:
      - Fetch Instances
    steps:
    - type: CUSTOM_DEPLOYMENT_FETCH_INSTANCES
      name: Fetch Instances
      properties:
        stateTimeoutInMinutes: 1
    - type: SHELL_SCRIPT
      name: Shell Script
      properties:
        commandPath: null
        connectionAttributeName: null
        executeOnDelegate: true
        host: null
        outputVars: ''
        publishAsVar: false
        scriptString: |-
          echo "Key: " $${artifact.key}

          echo "Image: " $${artifact.metadata.image}
        scriptType: BASH
        sshKeyRefName: null
        sweepingOutputName: null
        sweepingOutputScope: null
        templateExpressions: null
        templateVariables: ''
        timeoutMillis: 60000
    stepsInParallel: false
  - type: CUSTOM_DEPLOYMENT_PHASE_STEP
    name: Wrap Up
    stepSkipStrategies:
    - assertionExpression: $${workflow.variables.skip_destroy}=="true"
      scope: ALL_STEPS
    steps:
    - type: TERRAFORM_DESTROY
      name: Terraform Destroy
      properties:
        delegateTag: ''
        exportPlanToHumanReadableOutput: false
        inheritApprovedPlan: false
        provisionerName: Lambda Infra Deployment
        runPlanOnly: false
        timeoutMillis: 300000
        workspace: ''
    stepsInParallel: false
  provisionNodes: false
  statefulSet: false
  templateExpressions:
  - expression: $${Service}
    fieldName: serviceId
    metadata:
    - name: relatedField
    - name: artifactType
      value: DOCKER
    - name: entityType
      value: SERVICE
  - expression: $${InfraDefinition_CUSTOM}
    fieldName: infraDefinitionId
    metadata:
    - name: relatedField
    - name: entityType
      value: INFRASTRUCTURE_DEFINITION
rollbackPhases:
- type: CUSTOM
  computeProviderName: DUMMY_CLOUD_PROVIDER
  daemonSet: false
  infraDefinitionName: ca-central-1
  name: Rollback Phase 1
  phaseNameForRollback: Phase 1
  phaseSteps:
  - type: CUSTOM_DEPLOYMENT_PHASE_STEP
    name: Rollback Service
    steps:
    - type: COMMAND
      name: Rollback Lambda
      properties:
        commandName: rollback_lambda
        commandType: OTHER
        connectionAttributeName: null
        executeOnDelegate: true
        host: null
        outputVars: ''
        publishAsVar: false
        sshKeyRefName: null
        sweepingOutputName: null
        sweepingOutputScope: null
        templateExpressions: null
        timeoutMillis: 60000
      templateUri: "${var.short_harness_path}/${var.name}/rollback_lambda:latest"
    - type: CUSTOM_DEPLOYMENT_FETCH_INSTANCES
      name: Fetch Instances
      properties:
        stateTimeoutInMinutes: 1
    stepsInParallel: false
  provisionNodes: false
  statefulSet: false
  templateExpressions:
  - expression: $${Service}
    fieldName: serviceId
    metadata:
    - name: relatedField
    - name: artifactType
      value: DOCKER
    - name: entityType
      value: SERVICE
  - expression: $${InfraDefinition_CUSTOM}
    fieldName: infraDefinitionId
    metadata:
    - name: relatedField
    - name: entityType
      value: INFRASTRUCTURE_DEFINITION
templateExpressions:
- expression: $${Service}
  fieldName: serviceId
  metadata:
  - name: relatedField
  - name: artifactType
    value: DOCKER
  - name: entityType
    value: SERVICE
- expression: $${InfraDefinition_CUSTOM}
  fieldName: infraDefinitionId
  metadata:
  - name: relatedField
  - name: entityType
    value: INFRASTRUCTURE_DEFINITION
templatized: true
userVariables:
- type: ENTITY
  description: Variable for Service entity
  fixed: false
  mandatory: true
  name: Service
- type: ENTITY
  description: Variable for Infrastructure Definition entity
  fixed: false
  mandatory: true
  name: InfraDefinition_CUSTOM
- type: TEXT
  allowedValues: false, true
  fixed: false
  mandatory: true
  name: skip_tf
  value: 'true'
- type: TEXT
  allowedValues: false, true
  fixed: false
  mandatory: true
  name: skip_destroy
  value: 'true'
- type: TEXT
  allowedValues: false, true
  fixed: false
  mandatory: true
  name: skip_approval
  value: 'true'
EOF
}

# Setup/Applications/cloud-surf/Environments/dev/Infrastructure Definitions/awa-demo-infra.yaml
# Setup/Applications/Lab/Environments/dev/Infrastructure Definitions/lambda-nonprd-tf.yaml