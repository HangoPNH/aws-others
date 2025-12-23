################
### DynamoDB ###
################

# privisioned write capacity units
resource "aws_cloudwatch_metric_alarm" "dynamodb_tfstate_provisioned_write_capacity_units_usage_alarm" {
  alarm_name          = "[${title(var.infra_env)}] [DynamoDB] Table ${data.aws_dynamodb_table.tfstate_table.name} - Write Capacity Units [CRITICAL]"
  alarm_description   = "[CRITICAL] DynamoDB write usage of ${data.aws_dynamodb_table.tfstate_table.name} exceeds ${var.provisioned_write_capacity_units_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ProvisionedWriteCapacityUnits"
  namespace           = "AWS/DynamoDB"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.provisioned_write_capacity_units_threshold_3
  statistic           = "Average"

  dimensions = {
    TableName = data.aws_dynamodb_table.tfstate_table.name
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-dynamobd-write-capacity-units-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# privisioned read capacity units
resource "aws_cloudwatch_metric_alarm" "dynamodb_tfstate_provisioned_read_capacity_units_usage_alarm" {
  alarm_name          = "[${title(var.infra_env)}] [DynamoDB] Table ${data.aws_dynamodb_table.tfstate_table.name} - Read Capacity Units [CRITICAL]"
  alarm_description   = "[CRITICAL] DynamoDB read usage of ${data.aws_dynamodb_table.tfstate_table.name} exceeds ${var.provisioned_read_capacity_units_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ProvisionedReadCapacityUnits"
  namespace           = "AWS/DynamoDB"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.provisioned_read_capacity_units_threshold_3
  statistic           = "Average"

  dimensions = {
    TableName = data.aws_dynamodb_table.tfstate_table.name
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-dynamobd-read-capacity-units-usage-${var.region_name}-${var.infra_env}"
    }
  )
}