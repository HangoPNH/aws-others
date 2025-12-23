###################
### ECS Cluster ###
###################

### Fargate ###
## Rebuild ##
# retrieve ecs cluster
data "aws_ecs_cluster" "rebuild_ecs_cluster" {
  cluster_name = "${var.rebuild_ecs_cluster_name}-${var.region_name}-${var.infra_env}"
}

# retrieve ecs service
data "aws_ecs_service" "rebuild_ecs_service" {
  for_each = toset([
    "${var.rebuild_be}-service-${var.infra_env}"
  ])
  service_name = each.key
  cluster_arn  = data.aws_ecs_cluster.rebuild_ecs_cluster.arn
}

## Safesense ##
# retrieve ecs cluster
data "aws_ecs_cluster" "safe_sense_ecs_cluster" {
  cluster_name = "${var.safe_sense_ecs_cluster_name}-${var.region_name}-${var.infra_env}"
}

# retrieve ecs service
data "aws_ecs_service" "safe_sense_ecs_service" {
  for_each = toset([
    "${var.safe_sense_be}-service-${var.infra_env}",
    "${var.safe_sense_ai_video}-service-${var.infra_env}"
  ])
  service_name = each.key
  cluster_arn  = data.aws_ecs_cluster.safe_sense_ecs_cluster.arn
}


## Notification ##
# retrieve ecs cluster
data "aws_ecs_cluster" "notification_hub_ecs_cluster" {
  cluster_name = "${var.notification_hub_ecs_cluster_name}-${var.region_name}-${var.infra_env}"
}

# retrieve ecs service
data "aws_ecs_service" "notification_ecs_service" {
  for_each = toset([
    "${var.notification_hub}-service-${var.infra_env}",
    "${var.notification_sr}-service-${var.infra_env}",
  ])
  service_name = each.key
  cluster_arn  = data.aws_ecs_cluster.notification_hub_ecs_cluster.arn
}

## API Side Effect ##
# retrieve ecs cluster
data "aws_ecs_cluster" "api_se_ecs_cluster" {
  cluster_name = "${var.api_se_ecs_cluster_name}-${var.region_name}-${var.infra_env}"
}

# retrieve ecs service
data "aws_ecs_service" "api_se_ecs_service" {
  for_each = toset([
    "${var.api_se}-service-${var.infra_env}"
  ])
  service_name = each.key
  cluster_arn  = data.aws_ecs_cluster.api_se_ecs_cluster.arn
}

## VoIP ##
# retrieve ecs cluster
data "aws_ecs_cluster" "voip_ecs_cluster" {
  cluster_name = "${var.voip_ecs_cluster_name}-${var.region_name}-${var.infra_env}"
}

# retrieve ecs service
data "aws_ecs_service" "voip_ecs_service" {
  for_each = toset([
    "${var.voip_ecs_name}-be-service-${var.infra_env}"
  ])
  service_name = each.key
  cluster_arn  = data.aws_ecs_cluster.voip_ecs_cluster.arn
}

###################
### MQTT Broker ###
###################

data "aws_mq_broker" "company_mqtt_broker" {
  for_each    = toset(var.mqtt_broker_list)
  broker_name = each.key
}

###########
### ALB ###
###########

# alb
data "aws_lb" "rebuild_ecs_alb" {
  name = "${var.rebuild_ecs_alb}-${var.region_name}-${var.infra_env}"
}

data "aws_lb" "safe_sense_ecs_alb" {
  name = "${var.safe_sense_ecs_alb}-${var.region_name}-${var.infra_env}"
}

data "aws_lb" "notification_ecs_alb" {
  name = "${var.notification_ecs_alb}-${var.region_name}-${var.infra_env}"
}

data "aws_lb" "api_se_ecs_alb" {
  name = "${var.api_se_ecs_alb}-${var.region_name}-${var.infra_env}"
}

data "aws_lb" "voip_ecs_alb" {
  name = "${var.voip_ecs_alb}-${var.region_name}-${var.infra_env}"
}

# target group
data "aws_lb_target_group" "rebuild_ecs_alb_target_group" {
  for_each = toset(var.rebuild_ecs_alb_tg_list)
  name     = "${each.key}-tg-${var.region_name}-${var.infra_env}"
}

data "aws_lb_target_group" "safe_sense_ecs_alb_target_group" {
  for_each = toset(var.safe_sense_ecs_alb_tg_list)
  name     = "${each.key}-tg-${var.region_name}-${var.infra_env}"
}

data "aws_lb_target_group" "notification_ecs_alb_target_group" {
  for_each = toset(var.notification_ecs_alb_tg_list)
  name     = "${each.key}-tg-${var.region_name}-${var.infra_env}"
}

data "aws_lb_target_group" "api_se_ecs_alb_target_group" {
  for_each = toset(var.api_se_ecs_alb_tg_list)
  name     = "${each.key}-tg-${var.region_name}-${var.infra_env}"
}

data "aws_lb_target_group" "voip_ecs_alb_target_group" {
  for_each = toset(var.voip_ecs_alb_tg_list)
  name     = "${each.key}-tg-${var.region_name}-${var.infra_env}"
}

###################
### MSK Cluster ###
###################

data "aws_msk_cluster" "diac_msk_cluster" {
  cluster_name = "${var.diac_msk_cluster_name}-${var.infra_env}"
}

################
### DynamoDB ###
################

data "aws_dynamodb_table" "tfstate_table" {
  name = "tfstate-init-tfstate-${var.infra_env}"
}

###################
### ElastiCache ###
###################

data "aws_elasticache_serverless_cache" "rebuild_elasticache_redis_serverless_cache" {
  name = "${var.rebuild_redis_serverless_name}-${var.region_name}-${var.infra_env}"
}

data "aws_elasticache_serverless_cache" "safe_sense_elasticache_redis_serverless_cache" {
  name = "${var.safe_sense_redis_serverless_name}-${var.region_name}-${var.infra_env}"
}
