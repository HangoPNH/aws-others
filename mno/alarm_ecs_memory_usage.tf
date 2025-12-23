################################
### Rebuild ECS Memory Usage ###
################################

# memory usage 1st rule
resource "aws_cloudwatch_metric_alarm" "rebuild_ecs_fargate_low_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.rebuild_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [LOW]"
  alarm_description   = "[Low] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rebuild_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-ecs-fargate-low-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# memory usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "rebuild_ecs_fargate_high_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.rebuild_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [HIGH]"
  alarm_description   = "[High] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rebuild_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-ecs-fargate-high-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# memory usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "rebuild_ecs_fargate_critical_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.rebuild_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [CRITICAL]"
  alarm_description   = "[Critical] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rebuild_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-ecs-fargate-critical-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

##################################
### Safesense ECS Memory Usage ###
##################################

# memory usage 1st rule
resource "aws_cloudwatch_metric_alarm" "safe_sense_ecs_fargate_low_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.safe_sense_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [LOW]"
  alarm_description   = "[Low] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.safe_sense_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe-sense-hub-ecs-fargate-low-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# memory usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "safe_sense_ecs_fargate_high_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.safe_sense_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [HIGH]"
  alarm_description   = "[High] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.safe_sense_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe-sense-hub-ecs-fargate-high-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# memory usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "safe_sense_ecs_fargate_critical_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.safe_sense_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [CRITICAL]"
  alarm_description   = "[Critical] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.safe_sense_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe-sense-hub-ecs-fargate-critical-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

#########################################
### Notification Hub ECS Memory Usage ###
#########################################

# memory usage 1st rule
resource "aws_cloudwatch_metric_alarm" "notification_hub_ecs_fargate_low_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.notification_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [LOW]"
  alarm_description   = "[Low] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.notification_hub_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-hub-ecs-fargate-low-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# memory usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "notification_hub_ecs_fargate_high_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.notification_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [HIGH]"
  alarm_description   = "[High] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.notification_hub_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-hub-ecs-fargate-high-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# memory usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "notification_hub_ecs_fargate_critical_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.notification_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [CRITICAL]"
  alarm_description   = "[Critical] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.notification_hub_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-hub-ecs-fargate-critical-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

########################################
### API Side Effect ECS Memory Usage ###
########################################

# memory usage 1st rule
resource "aws_cloudwatch_metric_alarm" "api_se_ecs_fargate_low_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.api_se_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [LOW]"
  alarm_description   = "[Low] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.api_se_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-api-se-ecs-fargate-low-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# memory usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "api_se_ecs_fargate_high_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.api_se_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [HIGH]"
  alarm_description   = "[High] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.api_se_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-api-se-ecs-fargate-high-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# memory usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "api_se_ecs_fargate_critical_memory_utilization_alarm" {
  for_each = data.aws_ecs_service.api_se_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [CRITICAL]"
  alarm_description   = "[Critical] Memory Usage of ${each.key} exceeds ${var.ecs_memory_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.api_se_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-api-se-ecs-fargate-critical-memory-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

#############################
### VoIP ECS Memory Usage ###
#############################

# memory usage 1st rule
resource "aws_cloudwatch_metric_alarm" "voip_ecs_fargate_memory_low_utilization_alarm" {
  for_each = data.aws_ecs_service.voip_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [LOW]"
  alarm_description   = "Low memory usage of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.voip_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-ecs-fargate-low-memory-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# memory usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "voip_ecs_fargate_memory_high_utilization_alarm" {
  for_each = data.aws_ecs_service.voip_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [HIGH]"
  alarm_description   = "High memory usage of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.voip_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-ecs-fargate-high-memory-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# memory usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "voip_ecs_fargate_memory_critical_utilization_alarm" {
  for_each = data.aws_ecs_service.voip_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Memory Usage [CRITICAL]"
  alarm_description   = "Critical memory usage of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_memory_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.voip_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-ecs-fargate-critical-memory-usage-${var.region_name}-${var.infra_env}"
    }
  )
}
