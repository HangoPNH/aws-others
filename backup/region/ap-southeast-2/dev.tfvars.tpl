project_key_tag = "ciac"
project_name    = "company"
repo_name       = "others-backup"
region_name     = "sydney"
aws_region      = "ap-southeast-2"
infra_env       = "dev"

aws_backup_vault_name   = "aws-backup-vault"
aws_backup_plan         = "aws-backup-plan"
aws_backup_delete_after = "7"

# ec2
ec2_instance_id = [
  "arn:aws:ec2:ap-southeast-2:160193698567:instance/i-id", # jenkins-controller
  "arn:aws:ec2:ap-southeast-2:160193698567:instance/i-id"  # sonarqube
]

# rds
rds_instance_id = [
  "arn:aws:rds:ap-southeast-2:160193698567:db:diac-sonarqube-postgres-instance-sydney-dev", # sonarqube postgresql
  "arn:aws:rds:ap-southeast-2:160193698567:db:rebuild-be-mariadb-instance-sydney-dev"       # rebuild
]