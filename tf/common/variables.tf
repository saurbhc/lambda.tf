# Input variable definitions

variable "aws_region" {
  description = "AWS region for all resources."

  type    = string
  default = "eu-west-1"
}

variable "environment" {
  type = string
}

variable "source_path" {
  type = string
}

variable "apis" {
  type = list(object({
    path          = string # local folder path of your API file
    function_name = string # Unique name for your Lambda Function
    handler       = string # Function entrypoint in your code.
    route_key     = string # defines the API method and endpoint
  }))
}
