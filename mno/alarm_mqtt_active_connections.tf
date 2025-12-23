resource "aws_cloudwatch_metric_alarm" "mqtt_broker_active_connections_critical_alarm" {
  for_each = data.aws_mq_broker.company_mqtt_broker

  alarm_name          = "[${title(var.infra_env)}] [MQTT] ${each.key} - Active Connection [CRITICAL]"
  alarm_description   = "[Critical] Active Connection of ${each.key} exceeds ${var.mqtt_active_connection_threshold}% of Maximum Connections of ${var.mqtt_maximum_connection}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CurrentConnectionsCount"
  namespace           = "AWS/AmazonMQ"
  period              = "180"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = (var.mqtt_active_connection_threshold * var.mqtt_maximum_connection) / 100
  statistic           = "Average"

  dimensions = {
    Broker = each.key
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-mqtt-broker-critical-active-connections-${var.region_name}-${var.infra_env}"
    }
  )
}