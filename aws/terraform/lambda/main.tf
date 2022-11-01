resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  #filename      = "lambda_function_payload.zip"
  function_name = "${var.env}-${var.infra}-${var.svc}-lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  package_type  = "Zip"
  s3_bucket     = "tshain-harness-app-demo"
  s3_key        = "lambda/code/democode.zip"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "nodejs14.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}