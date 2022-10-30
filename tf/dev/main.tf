module "common" {
  source      = "../common"
  environment = "dev"
  source_path = "${path.module}/../../src"
  apis = [{
    path          = "${module.common.source_path}/api1"
    function_name = "Hello"
    handler       = "api1.hello"
    route_key     = "GET /hello"
    }, {
    path          = "${module.common.source_path}/api2"
    function_name = "Hi"
    handler       = "api2.hi"
    route_key     = "GET /hi"
    }, {
    path          = "${module.common.source_path}/api3"
    function_name = "Ciao-dev"
    handler       = "api3.ciao"
    route_key     = "GET /ciao"
  }]
}

# TODO: remove these outputs (only for debugging)

# output "apis" {
#   value = module.common.apis
# }

output "lambda_bucket_name" {
  value = module.common.lambda_bucket_name
}

output "function_names" {
  value = module.common.function_names
}

output "base_url" {
  value = module.common.base_url
}

# Archive multiple files and exclude file.
data "archive_file" "lambda_apis" {
  count = length(module.common.apis)

  type        = "zip"
  source_dir  = module.common.apis[count.index].path
  output_path = "${module.common.apis[count.index].path}.zip"
}
