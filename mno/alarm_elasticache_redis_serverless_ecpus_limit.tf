##################################################
### Rebuild ElastiCache Redis Serverless ECPUs ###
##################################################

resource "aws_cloudwatch_metric_alarm" "rebuild_elasticache_redis_serverless_cache_critical_ecpus_limit_alarm" {
  alarm_name          = "[${title(var.infra_env)}] [ElastiCache] Node ${data.aws_elasticache_serverless_cache.rebuild_elasticache_redis_serverless_cache.name} - ECPUs Limit [CRITICAL]"
  alarm_description   = "[Critical] Current ECPUs request limit of Node ${data.aws_elasticache_serverless_cache.rebuild_elasticache_redis_serverless_cache.name} exceed over 95% (${var.ecpus_max})"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ElastiCacheProcessingUnits"
  namespace           = "AWS/ElastiCache"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 1 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecpus_max * 0.95
  statistic           = "Average"

  dimensions = {
    "clusterId" = "${data.aws_elasticache_serverless_cache.rebuild_elasticache_redis_serverless_cache.name}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-rebuild-elasticache-redis-serverless-critical-ecpus-limit-${var.repo_name}-${var.infra_env}"
    }
  )
}

####################################################
### Safesense ElastiCache Redis Serverless ECPUs ###
####################################################

resource "aws_cloudwatch_metric_alarm" "safe_sense_elasticache_redis_serverless_cache_critical_ecpus_limit" {
  alarm_name          = "[${title(var.infra_env)}] [ElastiCache] Node ${data.aws_elasticache_serverless_cache.safe_sense_elasticache_redis_serverless_cache.name} - ECPUs Limit [CRITICAL]"
  alarm_description   = "[Critical] ECPUs request limit of Node ${data.aws_elasticache_serverless_cache.safe_sense_elasticache_redis_serverless_cache.name} is reaching over 95%"
  alarm_actions       = [aws_sns_topic.mno_sns_topic.arn]
  ok_actions          = [aws_sns_topic.mno_sns_topic.arn]
  actions_enabled     = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ElastiCacheProcessingUnits"
  namespace           = "AWS/ElastiCache"
  period              = "180" # seconds
  evaluation_periods  = "1"   # Evaluate 2 per period
  datapoints_to_alarm = "1"   # Trigger the alarm on 1 datapoint
  threshold           = var.ecpus_max * 0.95
  statistic           = "Average"

  dimensions = {
    "clusterId" = "${data.aws_elasticache_serverless_cache.safe_sense_elasticache_redis_serverless_cache.name}"
  }

  treat_missing_data = "notBreaching"

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alarm-safe-sense-elasticache-redis-serverless-critical-ecpus-limit-${var.repo_name}-${var.infra_env}"
    }
  )
}
