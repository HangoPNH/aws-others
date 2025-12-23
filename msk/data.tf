######################
### Secret Manager ###
######################

data "aws_secretsmanager_secret" "ciac_msk_secretsmanager_secret" {
  name = "AmazonMSK_Cluster-${var.project_key_tag}-${var.infra_env}"
}

data "aws_secretsmanager_secret_version" "ciac_msk_secretsmanager_version" {
  secret_id = data.aws_secretsmanager_secret.ciac_msk_secretsmanager_secret.id
}

###############
### Subnets ###
###############

data "aws_subnet" "public_cicd_subnet_cidrs" {
  count = length(var.public_cicd_subnet_ids)
  id    = element(var.public_cicd_subnet_ids, count.index)
}

data "aws_subnet" "private_app_subnet_cidrs" {
  count = length(var.private_app_subnet_ids)
  id    = element(var.private_app_subnet_ids, count.index)
}
