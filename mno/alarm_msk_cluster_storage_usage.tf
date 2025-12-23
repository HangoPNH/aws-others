########################################
### DIAC MSK Cluster Root Disk Usage ###
########################################

# storage usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "diac_msk_cluster_storage_critical_utilization_alarm" {

  # range(start, end) function itself does not include the end number in its output because it generates numbers up to, but not including => range(start, end + 1)
  for_each = toset([for i in range(1, data.aws_msk_cluster.diac_msk_cluster.number_of_broker_nodes + 1) : tostring(i)])

  alarm_name          = "[${title(var.infra_env)}] [MSK] Broker ${each.value} - Storage Usage [CRITICAL]"
  alarm_description   = "[Critical] Storage Usage of Broker ${each.value} exceeds ${var.msk_cluster_storage_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "RootDiskUsed"
  namespace           = "AWS/Kafka"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.msk_cluster_storage_threshold_3
  statistic           = "Average"

  dimensions = {
    "Broker ID"    = "${each.value}"
    "Cluster Name" = data.aws_msk_cluster.diac_msk_cluster.cluster_name
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-msk-cluster-critical-storage-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}