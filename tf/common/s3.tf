resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = "saurabh-test-lambda.tf-${var.environment}"
  force_destroy = true

  tags = {
    Name        = "saurabh-test-lambda.tf"
    Environment = "${var.environment}"
  }
}

resource "aws_s3_bucket_acl" "lambda_bucket_acl" {
  bucket = aws_s3_bucket.lambda_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "lambda_apis" {
  count = length(var.apis)

  bucket = aws_s3_bucket.lambda_bucket.id

  key    = element(split("/", var.apis[count.index].path), length(split("/", var.apis[count.index].path)) - 1)
  source = "${var.apis[count.index].path}.zip"

  etag = filemd5("${var.apis[count.index].path}.zip")
}
