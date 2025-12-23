# beacon function
resource "aws_lambda_function" "company_beacon_function" {
  function_name = "${var.company_beacon_function}-${var.region_name}-${var.infra_env}"
  filename      = "${var.company_beacon_function}.zip"
  handler       = "index.handler"
  role          = data.aws_iam_role.lambda_role.arn
  runtime       = "nodejs18.x"

  environment {
    variables = {
      "REGION_AWS"    = var.aws_region
      "SECRET_NAME"   = var.company_beacon_secret
      "VERSION_STAGE" = var.version_stage
    }
  }

  logging_config {
    log_format = "Text"
    log_group  = "/aws/lambda/${var.company_beacon_function}-${var.region_name}-${var.infra_env}"
  }

  timeout = var.company_beacon_function_timeout

  vpc_config {
    subnet_ids         = var.private_app_subnet_ids
    security_group_ids = [aws_security_group.company_beacon_function_sg.id]
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.company_beacon_function}-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_lambda_layer_version" "company_beacon_lambda_layer" {
  filename         = var.company_beacon_lambda_layer_file
  layer_name       = "${var.company_beacon_function}-layer"
  source_code_hash = filebase64sha256("${var.company_beacon_lambda_layer_file}")

  compatible_runtimes = ["nodejs16.x", "nodejs18.x", "nodejs20.x"]
}

### trggier AWS IoT ###
resource "aws_lambda_permission" "allow_iot" {
  statement_id  = "AllowExecutionFromIoT"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.company_beacon_function.function_name
  principal     = "iot.amazonaws.com"
  source_arn    = aws_iot_topic_rule.iot_company_beacon_topic_rule.arn
}
