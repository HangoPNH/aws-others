project_key_tag = "dwt"
project_name    = "wt-ai"
repo_name       = "other-iot"
region_name     = "sydney"
aws_region      = "ap-southeast-2"
infra_env       = "dev"

###########
### VPC ###
###########

vpc_id = ""
private_app_subnet_ids = [
  ""
]

##############
### Lambda ###
##############

# lambda
lambda_role                           = "wt-lambda-role"
company_beacon_function               = "company-beacon-lambda"
company_beacon_function_timeout       = 180
company_beacon_function_log_retention = 7
company_beacon_secret                 = "dev/company/beacon"
version_stage                         = "AWSCURRENT"

# layer
company_beacon_lambda_layer_file = "company-beacon-lambda.zip"

# sg
company_beacon_postgres_sg = ""

###########
### IOT ###
###########

iot_topic_rule_name = "beacon_battery_lambda_v1"
