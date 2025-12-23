project_key_tag = "ciac"
project_name    = "company"
repo_name       = "others-msk"
region_name     = "sydney"
aws_region      = "ap-southeast-2"
infra_env       = "prod"
vpc_id          = ""

private_app_subnet_ids = [
  ""
]
public_cicd_subnet_ids = [
  ""
]

###########
### MSK ###
###########

ciac_msk_cluster_name          = "ciac-msk-cluster"
ciac_msk_cluster_version       = "3.6.0"
number_of_broker_nodes         = "2"
ciac_msk_brokers_instance_type = "kafka.m7g.large"
ciac_msk_cloudwatch_log_group  = "ciac-msk-cw-log-group"
ciac_msk_configuration         = "ciac-msk-configuration"

##########
### CW ###
##########

cw_retention_in_days = "180"
