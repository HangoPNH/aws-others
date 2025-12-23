# cpu usage 1st rule
resource "aws_cloudwatch_metric_alarm" "mqtt_broker_cpu_low_utilization_alarm" {
  for_each = data.aws_mq_broker.company_mqtt_broker

  alarm_name          = "[${title(var.infra_env)}] [MQTT] ${each.key} - CPU Usage [LOW]"
  alarm_description   = "[Low] CPU Usage of ${each.key} exceeds ${var.mqtt_cpu_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CpuUtilization"
  namespace           = "AWS/AmazonMQ"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.mqtt_cpu_threshold_1
  statistic           = "Average"

  dimensions = {
    Broker = each.key
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-mqtt-broker-low-cpu-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# cpu usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "mqtt_broker_cpu_high_utilization_alarm" {
  for_each = data.aws_mq_broker.company_mqtt_broker

  alarm_name          = "[${title(var.infra_env)}] [MQTT] ${each.key} - CPU Usage [HIGH]"
  alarm_description   = "[High] CPU Usage of ${each.key} exceeds ${var.mqtt_cpu_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CpuUtilization"
  namespace           = "AWS/AmazonMQ"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.mqtt_cpu_threshold_2
  statistic           = "Average"

  dimensions = {
    Broker = each.key
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-mqtt-broker-high-cpu-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# cpu usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "mqtt_broker_cpu_critical_utilization_alarm" {
  for_each = data.aws_mq_broker.company_mqtt_broker

  alarm_name          = "[${title(var.infra_env)}] [MQTT] ${each.key} - CPU Usage [CRITICAL]"
  alarm_description   = "[Critical] CPU Usage of ${each.key} exceeds ${var.mqtt_cpu_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CpuUtilization"
  namespace           = "AWS/AmazonMQ"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.mqtt_cpu_threshold_3
  statistic           = "Average"

  dimensions = {
    Broker = each.key
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-mqtt-broker-critical-cpu-usage-${var.region_name}-${var.infra_env}"
    }
  )
}