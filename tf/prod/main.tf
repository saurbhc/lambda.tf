module "common" {
  source      = "../common"
  environment = "prod"
  source_path = "${path.module}/../../src"
  apis = [{
    path          = "${module.common.source_path}/api3"
    function_name = "Ciao"
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
