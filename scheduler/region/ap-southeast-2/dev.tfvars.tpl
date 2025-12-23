project_key_tag = "ciac"
project_name    = "company"
repo_name       = "others-scheduler"
region_name     = "sydney"
aws_region      = "ap-southeast-2"
infra_env       = "dev"

##############
### Lambda ###
##############

# ec2
start_ec2_function               = "start-ec2-function"
start_ec2_function_timeout       = 30
start_ec2_function_log_retention = 7

stop_ec2_function               = "stop-ec2-function"
stop_ec2_function_timeout       = 30
stop_ec2_function_log_retention = 7

ec2_instance_ids = "i-0ca42635c2d8ea956" # Jenkins

# rds
start_rds_function               = "start-rds-function"
start_rds_function_timeout       = 30
start_rds_function_log_retention = 7

stop_rds_function               = "stop-rds-function"
stop_rds_function_timeout       = 30
stop_rds_function_log_retention = 7

db_instance_identifiers = "rebuild-be-mariadb-instance-sydney-dev,ss-be-instance-sydney-dev,ss-ai-instance-sydney-dev"