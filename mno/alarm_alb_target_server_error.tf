###############################
### ALB Target Server Error ###
###############################

# rebuild
resource "aws_cloudwatch_metric_alarm" "rebuild_alb_target_server_error_alarm" {

  alarm_name          = "[${title(var.infra_env)}] [ALB] ${data.aws_lb.rebuild_ecs_alb.name} - ALB Target Server Error [CRITICAL]"
  alarm_description   = "[CRITICAL] ${data.aws_lb.rebuild_ecs_alb.name} ALB target server error"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = var.target_server_error_threshold
  statistic           = "Average"

  dimensions = {
    LoadBalancer = data.aws_lb.rebuild_ecs_alb.arn_suffix #LB only
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-alb-target-server-error-${var.region_name}-${var.infra_env}"
    }
  )
}

# safe-sense
resource "aws_cloudwatch_metric_alarm" "safe_sense_alb_target_server_error_alarm" {

  alarm_name          = "[${title(var.infra_env)}] [ALB] ${data.aws_lb.safe_sense_ecs_alb.name} - ALB Target Server Error [CRITICAL]"
  alarm_description   = "[CRITICAL] ${data.aws_lb.safe_sense_ecs_alb.name} ALB target server error"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = var.target_server_error_threshold
  statistic           = "Average"

  dimensions = {
    LoadBalancer = data.aws_lb.safe_sense_ecs_alb.arn_suffix #LB only
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safesense-alb-target-server-error-${var.region_name}-${var.infra_env}"
    }
  )
}

# notification
resource "aws_cloudwatch_metric_alarm" "notification_alb_target_server_error_alarm" {

  alarm_name          = "[${title(var.infra_env)}] [ALB] ${data.aws_lb.notification_ecs_alb.name} - ALB Target Server Error [CRITICAL]"
  alarm_description   = "[CRITICAL] ${data.aws_lb.notification_ecs_alb.name} ALB target server error"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = var.target_server_error_threshold
  statistic           = "Average"

  dimensions = {
    LoadBalancer = data.aws_lb.notification_ecs_alb.arn_suffix #LB only
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-notification-alb-target-server-error-${var.region_name}-${var.infra_env}"
    }
  )
}

# api side effect
resource "aws_cloudwatch_metric_alarm" "api_se_alb_target_server_error_alarm" {

  alarm_name          = "[${title(var.infra_env)}] [ALB] ${data.aws_lb.api_se_ecs_alb.name} - ALB Target Server Error [CRITICAL]"
  alarm_description   = "[CRITICAL] ${data.aws_lb.api_se_ecs_alb.name} ALB target server error"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = var.target_server_error_threshold
  statistic           = "Average"

  dimensions = {
    LoadBalancer = data.aws_lb.api_se_ecs_alb.arn_suffix #LB only
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-api-se-alb-target-server-error-${var.region_name}-${var.infra_env}"
    }
  )
}

# voip
resource "aws_cloudwatch_metric_alarm" "voip_alb_target_server_error_alarm" {

  alarm_name          = "[${title(var.infra_env)}] [ALB] ${data.aws_lb.voip_ecs_alb.name} - ALB Target Server Error [CRITICAL]"
  alarm_description   = "[CRITICAL] ${data.aws_lb.voip_ecs_alb.name} ALB target server error"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  threshold           = var.target_server_error_threshold
  statistic           = "Average"

  dimensions = {
    LoadBalancer = data.aws_lb.voip_ecs_alb.arn_suffix #LB only
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-voip-alb-target-server-error-${var.region_name}-${var.infra_env}"
    }
  )
}
