project_key_tag = "ciac"
project_name    = "company"
repo_name       = "others-api-gateway"
region_name     = "sydney"
aws_region      = "ap-southeast-2"
infra_env       = "dev"

json_template      = "api-gw.json"
api_gateway_domain = "api-gateway.dev.infra.company.com"

apigw_v1 = "v1"
apigw_v2 = "v2"
apigw_v3 = "v3"
apigw_v4 = "v4"
apigw_v5 = "v5"

### Rebuild ###
rebuild_alb_endpoint = "rebuild-ecs-alb.dev.infra.company.com"
rebuild_be_rest_port = "4000"

### API Side Effect ###
api_se_alb_endpoint = "api-se-ecs-alb.dev.infra.company.com"
api_se_rest_port = "4002"

### Safesense ###
safesense_alb_endpoint = "ss-ecs-alb.dev.infra.company.com"
safesense_be_rest_port = "3001"

###########
### ALB ###
###########

rebuild_ecs_alb   = "rebuild-ecs-alb"
api_se_ecs_alb    = "api-se-ecs-alb"
safesense_ecs_alb = "ss-ecs-alb"

################
### VPC link ###
################

rest_private = "rest-private"
private_app_subnet_ids = [
  ""
]
vpc_id = ""

###########
### R53 ###
###########

domain = "dev.infra.company.com"
