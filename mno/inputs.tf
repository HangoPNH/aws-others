variable "project_key_tag" {
  type        = string
  description = "Key tag of the Project"
}

variable "project_name" {
  type        = string
  description = "Name of the Project"
}

variable "region_name" {
  type        = string
  description = "Region of the Project"
}

variable "repo_name" {
  type        = string
  description = "Repo of the Project"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "infra_env" {
  type        = string
  description = "Infrastructure Environment"
}

##################
### SNS Topic  ###
##################

variable "sns_topic_name" {
  type = string
}

variable "sns_subscribers" {
  type = list(string)
}


####################
## ECS CloudWatch ##
####################

# rebuild
variable "rebuild_be" {
  type = string
}

variable "rebuild_ecs_cluster_name" {
  type = string
}

# safe-sense
variable "safe_sense_ecs_cluster_name" {
  type = string
}

variable "safe_sense_be" {
  type = string
}

variable "safe_sense_ai_video" {
  type = string
}

# notification hub
variable "notification_hub_ecs_cluster_name" {
  type = string
}

variable "notification_hub" {
  type = string
}

variable "notification_sr" {
  type = string
}

# api-se
variable "api_se" {
  type = string
}

variable "api_se_ecs_cluster_name" {
  type = string
}

# voip
variable "voip_ecs_cluster_name" {
  type = string
}

variable "voip_ecs_name" {
  type = string
}

# alarm rules
variable "ecs_cpu_threshold_1" {
  type = number
}

variable "ecs_cpu_threshold_2" {
  type = number
}

variable "ecs_cpu_threshold_3" {
  type = number
}

variable "ecs_fargate_storage_threshold_1" {
  type = number
}

variable "ecs_fargate_storage_threshold_2" {
  type = number
}

variable "ecs_fargate_storage_threshold_3" {
  type = number
}

variable "ecs_memory_threshold_1" {
  type = number
}

variable "ecs_memory_threshold_2" {
  type = number
}

variable "ecs_memory_threshold_3" {
  type = number
}

#########################
#### MQTT CloudWatch ####
#########################

variable "mqtt_broker_list" {
  type = list(string)
}

variable "mqtt_cpu_threshold_1" {
  type = number
}

variable "mqtt_cpu_threshold_2" {
  type = number
}

variable "mqtt_cpu_threshold_3" {
  type = number
}

variable "mqtt_storage_threshold_1" {
  type = number
}

variable "mqtt_storage_threshold_2" {
  type = number
}

variable "mqtt_storage_threshold_3" {
  type = number
}

variable "mqtt_heap_mem_threshold_1" {
  type = number
}

variable "mqtt_heap_mem_threshold_2" {
  type = number
}

variable "mqtt_heap_mem_threshold_3" {
  type = number
}

variable "mqtt_active_connection_threshold" {
  type = number
}

variable "mqtt_maximum_connection" {
  type = number
}

########################
#### ALB CloudWatch ####
########################

# rebuild
variable "rebuild_ecs_alb" {
  type = string
}

variable "rebuild_ecs_alb_tg_list" {
  type = list(string)
}

# safe-sense
variable "safe_sense_ecs_alb" {
  type = string
}

variable "safe_sense_ecs_alb_tg_list" {
  type = list(string)
}

# notification
variable "notification_ecs_alb" {
  type = string
}

variable "notification_ecs_alb_tg_list" {
  type = list(string)
}

# api-se
variable "api_se_ecs_alb" {
  type = string
}

variable "api_se_ecs_alb_tg_list" {
  type = list(string)
}

# voip
variable "voip_ecs_alb" {
  type = string
}

variable "voip_ecs_alb_tg_list" {
  type = list(string)
}


variable "target_response_time_threshold" {
  type = number
}

variable "target_server_error_threshold" {
  type = number
}

###################
### MSK Cluster ###
###################

variable "diac_msk_cluster_name" {
  type = string
}

variable "msk_cluster_cpu_threshold_3" {
  type = number
}

variable "msk_cluster_memory_threshold_3" {
  type = number
}

variable "msk_cluster_storage_threshold_3" {
  type = number
}

################
### DynamoDB ###
################

variable "provisioned_write_capacity_units_threshold_3" {
  type = number
}

variable "provisioned_read_capacity_units_threshold_3" {
  type = number
}

###################
### ElastiCache ###
###################


variable "data_storage_max" {
  type = number
}

variable "ecpus_max" {
  type = number
}

# rebuild
variable "rebuild_redis_serverless_name" {
  type = string
}

# safesense
variable "safe_sense_redis_serverless_name" {
  type = string
}
