###################
### API Gateway ###
###################

data "aws_api_gateway_rest_api" "api_gateway_rest_api" {
  name = "${var.project_key_tag}-apigw-${var.region_name}-${var.infra_env}"
}

###########
### ALB ###
###########

data "aws_lb" "rebuild_ecs_alb" {
  name = "${var.rebuild_ecs_alb}-${var.region_name}-${var.infra_env}"
}

data "aws_lb" "notification_ecs_alb" {
  name = "${var.notification_ecs_alb}-${var.region_name}-${var.infra_env}"
}

data "aws_lb" "safe_sense_ecs_alb" {
  name = "${var.safe_sense_ecs_alb}-${var.region_name}-${var.infra_env}"
}

data "aws_lb" "api_se_ecs_alb" {
  name = "${var.api_se_ecs_alb}-${var.region_name}-${var.infra_env}"
}
