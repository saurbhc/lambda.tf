# Output value definitions

output "apis" {
  value = var.apis
}

output "source_path" {
  value = var.source_path
}

output "lambda_bucket_name" {
  description = "Name of the S3 bucket used to store function code."

  value = aws_s3_bucket.lambda_bucket.id
}

output "function_names" {
  description = "Name(s) of the Lambda function(s)."

  value = aws_lambda_function.lambda_function_apis.*.function_name
}

output "base_url" {
  description = "Base URL for API Gateway stage."

  value = aws_apigatewayv2_stage.lambda.invoke_url
}
