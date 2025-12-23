# storage usage 1st rule
resource "aws_cloudwatch_metric_alarm" "mqtt_broker_storage_low_utilization_alarm" {
  for_each = data.aws_mq_broker.company_mqtt_broker

  alarm_name          = "[${title(var.infra_env)}] [MQTT] ${each.key} - Storage Usage [LOW]"
  alarm_description   = "[Low] Storage Usage of ${each.key} exceeds ${var.mqtt_storage_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "StorePercentUsage"
  namespace           = "AWS/AmazonMQ"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.mqtt_storage_threshold_1
  statistic           = "Average"

  dimensions = {
    Broker = each.key
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-mqtt-broker-low-storage-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# storage usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "mqtt_broker_storage_high_utilization_alarm" {
  for_each = data.aws_mq_broker.company_mqtt_broker

  alarm_name          = "[${title(var.infra_env)}] [MQTT] ${each.key} - Storage Usage [HIGH]"
  alarm_description   = "[High] Storage Usage of ${each.key} exceeds ${var.mqtt_storage_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "StorePercentUsage"
  namespace           = "AWS/AmazonMQ"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.mqtt_storage_threshold_2
  statistic           = "Average"

  dimensions = {
    Broker = each.key
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-mqtt-broker-high-storage-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# storage usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "mqtt_broker_storage_critical_utilization_alarm" {
  for_each = data.aws_mq_broker.company_mqtt_broker

  alarm_name          = "[${title(var.infra_env)}] [MQTT] ${each.key} - Storage Usage [CRITICAL]"
  alarm_description   = "[Critical] Storage Usage of ${each.key} exceeds ${var.mqtt_storage_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "StorePercentUsage"
  namespace           = "AWS/AmazonMQ"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.mqtt_storage_threshold_3
  statistic           = "Average"

  dimensions = {
    BrokerName = each.key
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-mqtt-broker-critical-storage-usage-${var.region_name}-${var.infra_env}"
    }
  )
}