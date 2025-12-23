#########################################################
### Rebuild ElastiCache Redis Serverless Data Storage ###
#########################################################

resource "aws_cloudwatch_metric_alarm" "rebuild_elasticache_redis_critical_data_storage_alarm" {
  alarm_name          = "[${title(var.infra_env)}] [ElastiCache] Node ${data.aws_elasticache_serverless_cache.rebuild_elasticache_redis_serverless_cache.name} - Data Storage [CRITICAL]"
  alarm_description   = "[Critical] Data Storage of Node ${data.aws_elasticache_serverless_cache.rebuild_elasticache_redis_serverless_cache.name} exceeds over 95% (${var.data_storage_max})"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "BytesUsedForCache"
  namespace           = "AWS/ElastiCache"
  period              = "180"                                            # seconds
  evaluation_periods  = "1"                                              # Evaluate 1 per period
  datapoints_to_alarm = "1"                                              # Trigger the alarm on 1 datapoint
  threshold           = var.data_storage_max * 1024 * 1024 * 1024 * 0.95 # convert GB to bytes
  statistic           = "Average"

  dimensions = {
    "clusterId" = "${data.aws_elasticache_serverless_cache.rebuild_elasticache_redis_serverless_cache.name}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-elasticache-redis-critical-data-storage-${var.repo_name}-${var.infra_env}"
    }
  )
}

###########################################################
### SafeSense ElastiCache Redis Serverless Data Storage ###
###########################################################

resource "aws_cloudwatch_metric_alarm" "safe_sense_elasticache_redis_critical_data_storage_alarm" {
  alarm_name          = "[${title(var.infra_env)}] [ElastiCache] Node ${data.aws_elasticache_serverless_cache.safe_sense_elasticache_redis_serverless_cache.name} - Data Storage [CRITICAL]"
  alarm_description   = "[Critical] Data Storage of Node ${data.aws_elasticache_serverless_cache.safe_sense_elasticache_redis_serverless_cache.name} exceeds over 95% (${var.data_storage_max})"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "BytesUsedForCache"
  namespace           = "AWS/ElastiCache"
  period              = "180"                                            # seconds
  evaluation_periods  = "1"                                              # Evaluate 1 per period
  datapoints_to_alarm = "1"                                              # Trigger the alarm on 1 datapoint
  threshold           = var.data_storage_max * 1024 * 1024 * 1024 * 0.95 # convert GB to bytes
  statistic           = "Average"

  dimensions = {
    "clusterId" = "${data.aws_elasticache_serverless_cache.safe_sense_elasticache_redis_serverless_cache.name}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe-sense-elasticache-redis-critical-data-storage-${var.repo_name}-${var.infra_env}"
    }
  )
}
