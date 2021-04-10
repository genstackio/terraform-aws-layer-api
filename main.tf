module "api" {
  source     = "genstackio/apigateway2-api/aws"
  version    = "0.1.3"
  name       = var.name
  lambda_arn = module.lambda.arn
}

module "api-custom-domain" {
  source    = "genstackio/apigateway2-api/aws//modules/domain"
  version   = "0.1.3"
  api       = module.api.id
  stage     = module.api.stage
  dns       = var.dns
  zone      = var.dns_zone
  providers = {
    aws = aws
    aws.acm = aws.acm
  }
}

module "lambda" {
  source            = "genstackio/lambda/aws"
  version           = "0.1.3"
  file              = var.package_file
  name              = var.name
  handler           = var.handler
  timeout           = var.timeout
  memory_size       = var.memory_size
  policy_statements = var.policy_statements
  variables         = var.variables
}
