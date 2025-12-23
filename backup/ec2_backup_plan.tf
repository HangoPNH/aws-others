######################
### AWS Backup EC2 ###
######################

resource "aws_backup_vault" "ec2_aws_backup_vault" {
  name        = "ec2-${var.aws_backup_vault_name}-${var.region_name}-${var.infra_env}"
  kms_key_arn = aws_kms_key.aws_backup_kms_key.arn
}

resource "aws_backup_plan" "ec2_backup_plan" {
  name = "ec2-${var.aws_backup_plan}-${var.region_name}-${var.infra_env}"

  rule {
    rule_name                = "daily-incremental-backup-${var.infra_env}"
    target_vault_name        = aws_backup_vault.ec2_aws_backup_vault.name
    schedule                 = "cron(0 14 * * ? *)"
    enable_continuous_backup = true
    start_window             = 60
    completion_window        = 180

    lifecycle {
      delete_after = var.aws_backup_delete_after
    }
  }

  rule {
    rule_name                = "weekly-backup-${var.infra_env}"
    target_vault_name        = aws_backup_vault.ec2_aws_backup_vault.name
    schedule                 = "cron(0 15 ? * 7 *)"
    enable_continuous_backup = false
    start_window             = 60
    completion_window        = 180

    lifecycle {
      delete_after = var.aws_backup_delete_after
    }
  }
  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-ec2-aws-backup-plan-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_backup_selection" "ec2_selection" {
  name         = "ec2-backup-selection-${var.region_name}-${var.infra_env}"
  plan_id      = aws_backup_plan.ec2_backup_plan.id
  iam_role_arn = data.aws_iam_role.aws_backup_iam_role.arn
  resources    = var.ec2_instance_id
}