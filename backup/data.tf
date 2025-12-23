##################
### AWS BACKUP ###
##################

data "aws_iam_role" "aws_backup_iam_role" {
  name = "backup-role-${var.infra_env}"
}