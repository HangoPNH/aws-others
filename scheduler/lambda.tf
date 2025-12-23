###########
### EC2 ###
###########

# start ec2
resource "aws_lambda_function" "start_ec2_function" {
  function_name = "${var.start_ec2_function}-${var.region_name}-${var.infra_env}"
  filename      = "${var.start_ec2_function}.zip"
  handler       = "start_ec2_function.lambda_handler"
  role          = data.aws_iam_role.lambda_role.arn
  runtime       = "python3.13"

  environment {
    variables = {
      "REGION_NAME"  = var.aws_region
      "INSTANCE_IDS" = var.ec2_instance_ids
    }
  }

  logging_config {
    log_format = "Text"
    log_group  = "/aws/lambda/${var.start_ec2_function}-${var.region_name}-${var.infra_env}"
  }

  timeout = var.start_ec2_function_timeout

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.start_ec2_function}-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_cloudwatch_log_group" "start_ec2_function_log_group_retention" {
  name              = "/aws/lambda/${aws_lambda_function.start_ec2_function.function_name}"
  retention_in_days = var.start_ec2_function_log_retention

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.start_ec2_function}-log-${var.region_name}-${var.infra_env}"
    }
  )
}

# stop ec2
resource "aws_lambda_function" "stop_ec2_function" {
  function_name = "${var.stop_ec2_function}-${var.region_name}-${var.infra_env}"
  filename      = "${var.stop_ec2_function}.zip"
  handler       = "stop_ec2_function.lambda_handler"
  role          = data.aws_iam_role.lambda_role.arn
  runtime       = "python3.13"

  environment {
    variables = {
      "REGION_NAME"  = var.aws_region
      "INSTANCE_IDS" = var.ec2_instance_ids
    }
  }

  logging_config {
    log_format = "Text"
    log_group  = "/aws/lambda/${var.stop_ec2_function}-${var.region_name}-${var.infra_env}"
  }

  timeout = var.stop_ec2_function_timeout

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.stop_ec2_function}-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_cloudwatch_log_group" "stop_ec2_function_log_group_retention" {
  name              = "/aws/lambda/${aws_lambda_function.stop_ec2_function.function_name}"
  retention_in_days = var.stop_ec2_function_log_retention

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.stop_ec2_function}-log-${var.region_name}-${var.infra_env}"
    }
  )
}

###########
### RDS ###
###########

# start rds
resource "aws_lambda_function" "start_rds_function" {
  function_name = "${var.start_rds_function}-${var.region_name}-${var.infra_env}"
  filename      = "${var.start_rds_function}.zip"
  handler       = "start_rds_function.lambda_handler"
  role          = data.aws_iam_role.lambda_role.arn
  runtime       = "python3.13"

  environment {
    variables = {
      "REGION_NAME"             = var.aws_region
      "DB_INSTANCE_IDENTIFIERS" = var.db_instance_identifiers
    }
  }

  logging_config {
    log_format = "Text"
    log_group  = "/aws/lambda/${var.start_rds_function}-${var.region_name}-${var.infra_env}"
  }

  timeout = var.start_rds_function_timeout

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.start_rds_function}-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_cloudwatch_log_group" "start_rds_function_log_group_retention" {
  name              = "/aws/lambda/${aws_lambda_function.start_rds_function.function_name}"
  retention_in_days = var.start_rds_function_log_retention

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.start_rds_function}-log-${var.region_name}-${var.infra_env}"
    }
  )
}

# stop rds
resource "aws_lambda_function" "stop_rds_function" {
  function_name = "${var.stop_rds_function}-${var.region_name}-${var.infra_env}"
  filename      = "${var.stop_rds_function}.zip"
  handler       = "stop_rds_function.lambda_handler"
  role          = data.aws_iam_role.lambda_role.arn
  runtime       = "python3.13"

  environment {
    variables = {
      "REGION_NAME"             = var.aws_region
      "DB_INSTANCE_IDENTIFIERS" = var.db_instance_identifiers
    }
  }

  logging_config {
    log_format = "Text"
    log_group  = "/aws/lambda/${var.stop_rds_function}-${var.region_name}-${var.infra_env}"
  }

  timeout = var.stop_rds_function_timeout

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.stop_rds_function}-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_cloudwatch_log_group" "stop_rds_function_log_group_retention" {
  name              = "/aws/lambda/${aws_lambda_function.stop_rds_function.function_name}"
  retention_in_days = var.stop_rds_function_log_retention

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.stop_rds_function}-log-${var.region_name}-${var.infra_env}"
    }
  )
}