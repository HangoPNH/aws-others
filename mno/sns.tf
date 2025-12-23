resource "aws_sns_topic" "mno_sns_topic" {
  name              = "${var.project_key_tag}-${var.sns_topic_name}-${var.region_name}-${var.infra_env}"
  kms_master_key_id = aws_kms_key.mno_sns_kms_key.arn
  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-sns-topic-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_sns_topic_subscription" "sns_subscribers" {
  for_each  = toset(var.sns_subscribers)
  topic_arn = aws_sns_topic.mno_sns_topic.arn
  protocol  = "email"
  endpoint  = each.key
}