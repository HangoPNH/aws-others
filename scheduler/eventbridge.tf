###########
### EC2 ###
###########

# start ec2
resource "aws_cloudwatch_event_rule" "scheduler_start_ec2_event_rule" {
  name                = "scheduler-start-ec2"
  description         = "Fires every morning at 3AM GMT+7"
  schedule_expression = "cron(0 20 * * ? *)"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-scheduler-start-ec2-event-rule-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_cloudwatch_event_target" "scheduler_start_ec2_event_target" {
  rule = aws_cloudwatch_event_rule.scheduler_start_ec2_event_rule.name
  arn  = aws_lambda_function.start_ec2_function.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_scheduler_start_ec2_event" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.start_ec2_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.scheduler_start_ec2_event_rule.arn
}

# stop ec2
resource "aws_cloudwatch_event_rule" "scheduler_stop_ec2_event_rule" {
  name                = "scheduler-stop-ec2"
  description         = "Fires every evening at 8PM GMT+7"
  schedule_expression = "cron(0 13 * * ? *)"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-scheduler-stop-ec2-event-rule-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_cloudwatch_event_target" "scheduler_stop_ec2_event_target" {
  rule = aws_cloudwatch_event_rule.scheduler_stop_ec2_event_rule.name
  arn  = aws_lambda_function.stop_ec2_function.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_scheduler_stop_ec2_event" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.stop_ec2_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.scheduler_stop_ec2_event_rule.arn
}

###########
### RDS ###
###########

# start rds
resource "aws_cloudwatch_event_rule" "scheduler_start_rds_event_rule" {
  name                = "scheduler-start-rds"
  description         = "Fires every morning at 3AM GMT+7"
  schedule_expression = "cron(0 20 * * ? *)"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-scheduler-start-rds-event-rule-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_cloudwatch_event_target" "scheduler_start_rds_event_target" {
  rule = aws_cloudwatch_event_rule.scheduler_start_rds_event_rule.name
  arn  = aws_lambda_function.start_rds_function.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_scheduler_start_rds_event" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.start_rds_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.scheduler_start_rds_event_rule.arn
}

# stop rds
resource "aws_cloudwatch_event_rule" "scheduler_stop_rds_event_rule" {
  name                = "scheduler-stop-rds"
  description         = "Fires every evening at 8PM GMT+7"
  schedule_expression = "cron(0 13 * * ? *)"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-scheduler-stop-rds-event-rule-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_cloudwatch_event_target" "scheduler_stop_rds_event_target" {
  rule = aws_cloudwatch_event_rule.scheduler_stop_rds_event_rule.name
  arn  = aws_lambda_function.stop_rds_function.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_scheduler_stop_rds_event" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.stop_rds_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.scheduler_stop_rds_event_rule.arn
}