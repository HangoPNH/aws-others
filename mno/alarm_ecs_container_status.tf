####################################
### Rebuild ECS Container Status ###
####################################

# container status
resource "aws_cloudwatch_metric_alarm" "rebuild_ecs_fargate_status_alarm" {
  for_each = data.aws_ecs_service.rebuild_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Container Down [CRITICAL]"
  alarm_description   = "Critical Container Status of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "LessThanThreshold"
  metric_name         = "RunningTaskCount"
  namespace           = "ECS/ContainerInsights"
  period              = "60" # seconds
  evaluation_periods  = "1"  # Evaluate 1 per period
  datapoints_to_alarm = "1"  # Trigger the alarm on 1 datapoint
  threshold           = "1"
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rebuild_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-ecs-fargate-status-${var.repo_name}-${var.infra_env}"
    }
  )
}

######################################
### Safesense ECS Container Status ###
######################################

# container status
resource "aws_cloudwatch_metric_alarm" "safe_sense_ecs_fargate_status_alarm" {
  for_each = data.aws_ecs_service.safe_sense_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Container Down [CRITICAL]"
  alarm_description   = "Critical Container Status of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "LessThanThreshold"
  metric_name         = "RunningTaskCount"
  namespace           = "ECS/ContainerInsights"
  period              = "60" # seconds
  evaluation_periods  = "1"  # Evaluate 1 per period
  datapoints_to_alarm = "1"  # Trigger the alarm on 1 datapoint
  threshold           = "1"
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.safe_sense_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safesense-ecs-fargate-status-${var.repo_name}-${var.infra_env}"
    }
  )
}

#########################################
### Notification ECS Container Status ###
#########################################

# container status
resource "aws_cloudwatch_metric_alarm" "notification_hub_ecs_fargate_status_alarm" {
  for_each = data.aws_ecs_service.notification_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Container Down [CRITICAL]"
  alarm_description   = "Critical Container Status of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "LessThanThreshold"
  metric_name         = "RunningTaskCount"
  namespace           = "ECS/ContainerInsights"
  period              = "60" # seconds
  evaluation_periods  = "1"  # Evaluate 1 per period
  datapoints_to_alarm = "1"  # Trigger the alarm on 1 datapoint
  threshold           = "1"
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.notification_hub_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-hub-ecs-fargate-status-${var.repo_name}-${var.infra_env}"
    }
  )
}

############################################
### API Side Effect ECS Container Status ###
############################################

# container status
resource "aws_cloudwatch_metric_alarm" "api_se_ecs_fargate_status_alarm" {
  for_each = data.aws_ecs_service.api_se_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Container Down [CRITICAL]"
  alarm_description   = "Critical Container Status of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "LessThanThreshold"
  metric_name         = "RunningTaskCount"
  namespace           = "ECS/ContainerInsights"
  period              = "60" # seconds
  evaluation_periods  = "1"  # Evaluate 1 per period
  datapoints_to_alarm = "1"  # Trigger the alarm on 1 datapoint
  threshold           = "1"
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.api_se_ecs_cluster.cluster_name
    ServiceName = "${each.key}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-api-se-ecs-fargate-status-${var.repo_name}-${var.infra_env}"
    }
  )
}

###################################
#### VoIP ECS Container Status ####
###################################

# container status
resource "aws_cloudwatch_metric_alarm" "voip_ecs_fargate_status_alarm" {
  for_each = data.aws_ecs_service.voip_ecs_service

  alarm_name          = "[${title(var.infra_env)}] [ECS] ${each.key} - Container Down [CRITICAL]"
  alarm_description   = "Critical Container Status of ${each.key}"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "LessThanThreshold"
  metric_name         = "RunningTaskCount"
  namespace           = "ECS/ContainerInsights"
  period              = "60" # seconds
  evaluation_periods  = "1"  # Evaluate 1 per period
  datapoints_to_alarm = "1"  # Trigger the alarm on 1 datapoint
  threshold           = "1"
  statistic           = "Average"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.voip_ecs_cluster.cluster_name
    ServiceName = each.key
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-ecs-status-${var.region_name}-${var.infra_env}"
    }
  )
}