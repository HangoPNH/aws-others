###################
### API Gateway ###
###################

output "aws_api_gateway_rest_api_id" {
  value = aws_api_gateway_rest_api.api_gateway_rest_api.id
}

output "aws_api_gateway_rest_api_arn" {
  value = aws_api_gateway_rest_api.api_gateway_rest_api.arn
}

output "aws_api_gateway_stage_arn_v1" {
  value = aws_api_gateway_stage.aws_api_gateway_stage_v1.arn
}

output "aws_api_gateway_stage_arn_v2" {
  value = aws_api_gateway_stage.aws_api_gateway_stage_v2.arn
}

output "aws_api_gateway_stage_arn_v3" {
  value = aws_api_gateway_stage.aws_api_gateway_stage_v3.arn
}