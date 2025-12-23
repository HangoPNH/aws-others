resource "aws_cloudwatch_log_group" "company_beacon_function_log_group_retention" {
  name              = "/aws/lambda/${aws_lambda_function.company_beacon_function.function_name}"
  retention_in_days = var.company_beacon_function_log_retention

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.company_beacon_function}-log-${var.region_name}-${var.infra_env}"
    }
  )
}