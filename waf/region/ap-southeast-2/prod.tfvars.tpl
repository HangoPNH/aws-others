project_key_tag = "ciac"
project_name    = "company"
repo_name       = "others-waf"
region_name     = "sydney"
aws_region      = "ap-southeast-2"
infra_env       = "prod"

###########
### WAF ###
###########

waf_apigw_cloudwatch_metrics_enabled   = true
waf_apigw_sampled_requests_enabled     = true
waf_apigw_bot_control_inspection_level = "COMMON" # Options: "COMMON" or "TARGETED"

waf_alb_cloudwatch_metrics_enabled   = true
waf_alb_sampled_requests_enabled     = true
waf_alb_bot_control_inspection_level = "COMMON"

rebuild_ecs_alb      = "rebuild-ecs-alb"
notification_ecs_alb = "notification-ecs-alb"
safe_sense_ecs_alb   = "ss-ecs-alb"
api_se_ecs_alb       = "api-se-ecs-alb"
