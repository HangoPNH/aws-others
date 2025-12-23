################################
### Rebuild ECS Storage Usge ###
################################

# storage usage 1st rule
resource "aws_cloudwatch_metric_alarm" "rebuild_ecs_fargate_low_storage_utilization_alarm" {
  for_each = data.aws_ecs_service.rebuild_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Storage Usage [LOW]"
  alarm_description   = "[Low] Storage Usage of ${each.key} exceeds ${var.ecs_fargate_storage_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rebuild_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-ecs-fargate-low-storage-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# storage usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "rebuild_ecs_fargate_high_storage_utilization_alarm" {
  for_each = data.aws_ecs_service.rebuild_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Storage Usage [HIGH]"
  alarm_description   = "[High] Storage Usage of ${each.key} exceeds ${var.ecs_fargate_storage_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rebuild_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-ecs-fargate-high-storage-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# storage usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "rebuild_ecs_fargate_critical_storage_utilization_alarm" {
  for_each = data.aws_ecs_service.rebuild_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Storage Usage [CRITICAL]"
  alarm_description   = "[Critical] Storage Usage of ${each.key} exceeds ${var.ecs_fargate_storage_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rebuild_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-ecs-fargate-critical-storage-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

######################################
### Safesense Hub ECS Storage Usge ###
######################################

# storage usage 1st rule
resource "aws_cloudwatch_metric_alarm" "safe_sense_ecs_fargate_low_storage_utilization_alarm" {
  for_each = data.aws_ecs_service.safe_sense_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Storage Usage [LOW]"
  alarm_description   = "[Low] Storage Usage of ${each.key} exceeds ${var.ecs_fargate_storage_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.safe_sense_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe-sense-hub-ecs-fargate-low-storage-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# storage usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "safe_sense_ecs_fargate_high_storage_utilization_alarm" {
  for_each = data.aws_ecs_service.safe_sense_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Storage Usage [HIGH]"
  alarm_description   = "[High] Storage Usage of ${each.key} exceeds ${var.ecs_fargate_storage_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.safe_sense_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe-sense-hub-ecs-fargate-high-storage-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# storage usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "safe_sense_ecs_fargate_critical_storage_utilization_alarm" {
  for_each = data.aws_ecs_service.safe_sense_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Storage Usage [CRITICAL]"
  alarm_description   = "[Critical] Storage Usage of ${each.key} exceeds ${var.ecs_fargate_storage_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.safe_sense_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe-sense-hub-ecs-fargate-critical-storage-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

#########################################
### Notification Hub ECS Storage Usge ###
#########################################

# storage usage 1st rule
resource "aws_cloudwatch_metric_alarm" "notification_hub_ecs_fargate_low_storage_utilization_alarm" {
  for_each = data.aws_ecs_service.notification_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Storage Usage [LOW]"
  alarm_description   = "[Low] Storage Usage of ${each.key} exceeds ${var.ecs_fargate_storage_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.notification_hub_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-hub-ecs-fargate-low-storage-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# storage usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "notification_hub_ecs_fargate_high_storage_utilization_alarm" {
  for_each = data.aws_ecs_service.notification_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Storage Usage [HIGH]"
  alarm_description   = "[High] Storage Usage of ${each.key} exceeds ${var.ecs_fargate_storage_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.notification_hub_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-hub-ecs-fargate-high-storage-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# storage usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "notification_hub_ecs_fargate_critical_storage_utilization_alarm" {
  for_each = data.aws_ecs_service.notification_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Storage Usage [CRITICAL]"
  alarm_description   = "[Critical] Storage Usage of ${each.key} exceeds ${var.ecs_fargate_storage_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.notification_hub_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-hub-ecs-fargate-critical-storage-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

#############################
### VoIP ECS Storage Usge ###
#############################

# disk usage 1st rule
resource "aws_cloudwatch_metric_alarm" "voip_ecs_fargate_disk_low_utilization_alarm" {
  for_each = data.aws_ecs_service.voip_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Disk Usage [LOW]"
  alarm_description   = "Low disk usage of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.voip_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-ecs-fargate-low-disk-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# disk usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "voip_ecs_fargate_disk_high_utilization_alarm" {
  for_each = data.aws_ecs_service.voip_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Disk Usage [HIGH]"
  alarm_description   = "High disk usage of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.voip_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-ecs-fargate-high-disk-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# disk usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "voip_ecs_fargate_disk_critical_utilization_alarm" {
  for_each = data.aws_ecs_service.voip_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Disk Usage [CRITICAL]"
  alarm_description   = "Critical disk usage of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "EphemeralStorageUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_fargate_storage_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.voip_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-ecs-fargate-critical-disk-usage-${var.region_name}-${var.infra_env}"
    }
  )
}
