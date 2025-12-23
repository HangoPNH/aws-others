###########
### ALB ###
###########

data "aws_lb" "rebuild_ecs_alb" {
  name = "${var.rebuild_ecs_alb}-${var.region_name}-${var.infra_env}"
}

data "aws_lb" "api_se_ecs_alb" {
  name = "${var.api_se_ecs_alb}-${var.region_name}-${var.infra_env}"
}

data "aws_lb" "ss_ecs_alb" {
  name = "${var.safesense_ecs_alb}-${var.region_name}-${var.infra_env}"
}