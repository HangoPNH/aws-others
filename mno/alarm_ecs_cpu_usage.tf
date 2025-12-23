#############################
### Rebuild ECS CPU Usage ###
#############################

# cpu usage 1st rule
resource "aws_cloudwatch_metric_alarm" "rebuild_ecs_fargate_low_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.rebuild_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [LOW]"
  alarm_description   = "[Low] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rebuild_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-ecs-fargate-low-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# cpu usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "rebuild_ecs_fargate_high_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.rebuild_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [HIGH]"
  alarm_description   = "[High] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rebuild_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-ecs-fargate-high-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# cpu usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "rebuild_ecs_fargate_critical_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.rebuild_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [CRITICAL]"
  alarm_description   = "[Critical] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rebuild_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-ecs-fargate-critical-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

###############################
### Safesense ECS CPU Usage ###
###############################

# cpu usage 1st rule
resource "aws_cloudwatch_metric_alarm" "safe_sense_ecs_fargate_low_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.safe_sense_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [LOW]"
  alarm_description   = "[Low] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.safe_sense_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe_sense-hub-ecs-fargate-low-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# cpu usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "safe_sense_ecs_fargate_high_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.safe_sense_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [HIGH]"
  alarm_description   = "[High] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.safe_sense_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe_sense-hub-ecs-fargate-high-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# cpu usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "safe_sense_ecs_fargate_critical_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.safe_sense_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [CRITICAL]"
  alarm_description   = "[Critical] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.safe_sense_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe_sense-hub-ecs-fargate-critical-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

######################################
### Notification Hub ECS CPU Usage ###
######################################

# cpu usage 1st rule
resource "aws_cloudwatch_metric_alarm" "notification_hub_ecs_fargate_low_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.notification_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [LOW]"
  alarm_description   = "[Low] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.notification_hub_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-hub-ecs-fargate-low-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# cpu usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "notification_hub_ecs_fargate_high_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.notification_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [HIGH]"
  alarm_description   = "[High] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.notification_hub_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-hub-ecs-fargate-high-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# cpu usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "notification_hub_ecs_fargate_critical_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.notification_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [CRITICAL]"
  alarm_description   = "[Critical] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.notification_hub_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-hub-ecs-fargate-critical-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

#####################################
### API Side Effect ECS CPU Usage ###
#####################################

# cpu usage 1st rule
resource "aws_cloudwatch_metric_alarm" "api_se_ecs_fargate_low_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.api_se_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [LOW]"
  alarm_description   = "[Low] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_1}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.api_se_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-api-se-ecs-fargate-low-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# cpu usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "api_se_ecs_fargate_high_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.api_se_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [HIGH]"
  alarm_description   = "[High] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_2}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.api_se_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-api-se-ecs-fargate-high-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

# cpu usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "api_se_ecs_fargate_critical_cpu_utilization_alarm" {
  for_each = data.aws_ecs_service.api_se_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [CRITICAL]"
  alarm_description   = "[Critical] CPU Usage of ${each.key} exceeds ${var.ecs_cpu_threshold_3}%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.api_se_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-api-se-ecs-fargate-critical-cpu-usage-${var.repo_name}-${var.infra_env}"
    }
  )
}

##########################
### VoIP ECS CPU Usage ###
##########################

# cpu usage 1st rule
resource "aws_cloudwatch_metric_alarm" "voip_ecs_fargate_cpu_low_utilization_alarm" {
  for_each = data.aws_ecs_service.voip_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [LOW]"
  alarm_description   = "Low CPU Usage of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "300" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_1
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.voip_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-ecs-fargate-low-cpu-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# cpu usage 2nd rule
resource "aws_cloudwatch_metric_alarm" "voip_ecs_fargate_cpu_high_utilization_alarm" {
  for_each = data.aws_ecs_service.voip_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [HIGH]"
  alarm_description   = "High CPU Usage of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_2
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.voip_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-ecs-fargate-high-cpu-usage-${var.region_name}-${var.infra_env}"
    }
  )
}

# cpu usage 3rd rule
resource "aws_cloudwatch_metric_alarm" "voip_ecs_fargate_cpu_critical_utilization_alarm" {
  for_each = data.aws_ecs_service.voip_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - CPU Usage [CRITICAL]"
  alarm_description   = "Critical CPU Usage of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecs_cpu_threshold_3
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.voip_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-ecs-fargate-critical-cpu-usage-${var.region_name}-${var.infra_env}"
    }
  )
}