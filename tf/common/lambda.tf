resource "aws_lambda_function" "lambda_function_apis" {
  count = length(var.apis)

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  runtime   = "python3.8"

  function_name    = var.apis[count.index].function_name
  s3_key           = aws_s3_object.lambda_apis[count.index].key
  handler          = var.apis[count.index].handler
  source_code_hash = filebase64sha256("${var.apis[count.index].path}.zip")

  role = aws_iam_role.lambda_exec.arn
}
