################################
### ALB Target Response Time ###
################################

# rebuild
resource "aws_cloudwatch_metric_alarm" "rebuid_alb_target_response_time_alarm" {
  for_each = data.aws_lb_target_group.rebuild_ecs_alb_target_group

  alarm_name          = "[${title(var.infra_env)}] [ALB] ${data.aws_lb_target_group.rebuild_ecs_alb_target_group[each.key].name} - ALB Target High Response Time [WARNING]"
  alarm_description   = "[WARNING] ${data.aws_lb_target_group.rebuild_ecs_alb_target_group[each.key].name} ALB target took over ${var.target_response_time_threshold} seconds to respond"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanThreshold"
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = var.target_response_time_threshold # seconds
  statistic           = "Average"

  dimensions = {
    LoadBalancer = data.aws_lb.rebuild_ecs_alb.arn_suffix
    TargetGroup  = each.value.arn_suffix
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-alb-target-response-time-${var.region_name}-${var.infra_env}"
    }
  )
}

# safe-sense
resource "aws_cloudwatch_metric_alarm" "safe_sense_alb_target_response_time_alarm" {
  for_each = data.aws_lb_target_group.safe_sense_ecs_alb_target_group

  alarm_name          = "[${title(var.infra_env)}] [ALB] ${data.aws_lb_target_group.safe_sense_ecs_alb_target_group[each.key].name} - ALB Target High Response Time [WARNING]"
  alarm_description   = "[WARNING] ${data.aws_lb_target_group.safe_sense_ecs_alb_target_group[each.key].name} ALB target took over ${var.target_response_time_threshold} seconds to respond"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanThreshold"
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = var.target_response_time_threshold # seconds
  statistic           = "Average"

  dimensions = {
    LoadBalancer = data.aws_lb.safe_sense_ecs_alb.arn_suffix
    TargetGroup  = each.value.arn_suffix
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safesense-alb-target-response-time-${var.region_name}-${var.infra_env}"
    }
  )
}

# notification
resource "aws_cloudwatch_metric_alarm" "notification_alb_target_response_time_alarm" {
  for_each = data.aws_lb_target_group.notification_ecs_alb_target_group

  alarm_name          = "[${title(var.infra_env)}] [ALB] ${data.aws_lb_target_group.notification_ecs_alb_target_group[each.key].name} - ALB Target High Response Time [WARNING]"
  alarm_description   = "[WARNING] ${data.aws_lb_target_group.notification_ecs_alb_target_group[each.key].name} ALB target took over ${var.target_response_time_threshold} seconds to respond"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanThreshold"
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = var.target_response_time_threshold # seconds
  statistic           = "Average"

  dimensions = {
    LoadBalancer = data.aws_lb.notification_ecs_alb.arn_suffix
    TargetGroup  = each.value.arn_suffix
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-alb-target-response-time-${var.region_name}-${var.infra_env}"
    }
  )
}

# api side effect
resource "aws_cloudwatch_metric_alarm" "api_se_alb_target_response_time_alarm" {
  for_each = data.aws_lb_target_group.api_se_ecs_alb_target_group

  alarm_name          = "[${title(var.infra_env)}] [ALB] ${data.aws_lb_target_group.api_se_ecs_alb_target_group[each.key].name} - ALB Target High Response Time [WARNING]"
  alarm_description   = "[WARNING] ${data.aws_lb_target_group.api_se_ecs_alb_target_group[each.key].name} ALB target took over ${var.target_response_time_threshold} seconds to respond"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanThreshold"
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = var.target_response_time_threshold # seconds
  statistic           = "Average"

  dimensions = {
    LoadBalancer = data.aws_lb.api_se_ecs_alb.arn_suffix
    TargetGroup  = each.value.arn_suffix
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-api-se-alb-target-response-time-${var.region_name}-${var.infra_env}"
    }
  )
}

# voip
resource "aws_cloudwatch_metric_alarm" "voip_alb_target_response_time_alarm" {
  for_each = data.aws_lb_target_group.voip_ecs_alb_target_group

  alarm_name          = "[${title(var.infra_env)}] [ALB] ${data.aws_lb_target_group.voip_ecs_alb_target_group[each.key].name} - ALB Target High Response Time [WARNING]"
  alarm_description   = "[WARNING] ${data.aws_lb_target_group.voip_ecs_alb_target_group[each.key].name} ALB target took over ${var.target_response_time_threshold} seconds to respond"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanThreshold"
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = var.target_response_time_threshold # seconds
  statistic           = "Average"

  dimensions = {
    LoadBalancer = data.aws_lb.voip_ecs_alb.arn_suffix
    TargetGroup  = each.value.arn_suffix
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-alb-target-response-time-${var.region_name}-${var.infra_env}"
    }
  )
}