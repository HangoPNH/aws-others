project_key_tag = "ciac"
project_name    = "company"
repo_name       = "others-mno"
region_name     = "sydney"
aws_region      = "ap-southeast-2"
infra_env       = "dev"

#################
### SNS Topic ###
#################

sns_topic_name  = "mno-sns-topic"

sns_subscribers = [
  "pnhuy@office.com.vn"
]

###################
### ECS Cluster ###
###################

# rebuild
rebuild_ecs_cluster_name = "rebuild-ecs-cluster"
rebuild_be               = "rebuild-be"

# safesense
safe_sense_ecs_cluster_name = "safe-sense-ecs-cluster"
safe_sense_be               = "safesense-be"
safe_sense_ai_video         = "safesense-ai-video"

# notification
notification_hub_ecs_cluster_name = "notification-hub-ecs-cluster"
notification_hub                  = "notification-hub"
notification_sr                   = "notification-sr"

# api_se
api_se_ecs_cluster_name = "api-se-ecs-cluster"
api_se                  = "api-se"

# voip
voip_ecs_cluster_name   = "voip-ecs-cluster"
voip_ecs_name           = "voip"

## alarm rules
# ecs cpu
ecs_cpu_threshold_1              = 80
ecs_cpu_threshold_2              = 85
ecs_cpu_threshold_3              = 90

# ecs memory
ecs_memory_threshold_1           = 80
ecs_memory_threshold_2           = 85
ecs_memory_threshold_3           = 90

# ecs fargate storage
ecs_fargate_storage_threshold_1  = 80
ecs_fargate_storage_threshold_2  = 85
ecs_fargate_storage_threshold_3  = 90


###################
### MQTT Broker ###
###################

mqtt_broker_list = [
  "rebuild-apache-mq-sydney-dev"
]

# mqtt cpu
mqtt_cpu_threshold_1       = 80
mqtt_cpu_threshold_2       = 85
mqtt_cpu_threshold_3       = 90

# mqtt memory
mqtt_heap_mem_threshold_1  = 80
mqtt_heap_mem_threshold_2  = 85
mqtt_heap_mem_threshold_3  = 90

# mqtt fargate storage
mqtt_storage_threshold_1   = 80
mqtt_storage_threshold_2   = 85
mqtt_storage_threshold_3   = 90

# mqtt active connections
mqtt_active_connection_threshold = 90
mqtt_maximum_connection          = 300

###########
### ALB ###
###########

# rebuild
rebuild_ecs_alb = "rebuild-ecs-alb"
rebuild_ecs_alb_tg_list = [
  "rebuild-be"
]

# safesense
safe_sense_ecs_alb = "ss-ecs-alb"
safe_sense_ecs_alb_tg_list = [
  "ss-be",
  "ss-ai-video"
]

# notification
notification_ecs_alb = "notification-ecs-alb"
notification_ecs_alb_tg_list = [
  "notification-hub",
  "notification-sr"
]

# api_se
api_se_ecs_alb = "api-se-ecs-alb"
api_se_ecs_alb_tg_list = [
  "api-se"
]

# voip
voip_ecs_alb = "voip-ecs-alb"
voip_ecs_alb_tg_list = [
  "voip-be"
]

target_response_time_threshold = 2
target_server_error_threshold  = 1


###################
### MSK Cluster ###
###################

ciac_msk_cluster_name           = "ciac-msk-cluster"
msk_cluster_cpu_threshold_3     = 95
msk_cluster_memory_threshold_3  = 100000000 # ~100MB
msk_cluster_storage_threshold_3 = 90

################
### DynamoDB ###
################

provisioned_write_capacity_units_threshold_3 = 90
provisioned_read_capacity_units_threshold_3  = 90

###################
### ElastiCache ###
###################

data_storage_max = 20
ecpus_max = 10000

# rebuild
rebuild_redis_serverless_name    = "rebuild-redis-serverless"

# safesense
safe_sense_redis_serverless_name = "ss-redis-serverless"
