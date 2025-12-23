##################
### AWS MSK CW ###
##################

resource "aws_cloudwatch_log_group" "ciac_msk_cloudwatch_log_group" {
  name              = "${var.ciac_msk_cloudwatch_log_group}-${var.region_name}-${var.infra_env}"
  retention_in_days = var.cw_retention_in_days
  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-msk-cw-log-${var.region_name}-${var.infra_env}"
    }
  )
}