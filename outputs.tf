output "endpoint" {
  value = "https://${var.dns}"
}
output "lambda_arn" {
  value = module.lambda.arn
}