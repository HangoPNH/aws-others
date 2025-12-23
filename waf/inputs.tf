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
  description = "Repository of the Project"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "infra_env" {
  type        = string
  description = "Infrastructure Environment"
}

###########
### WAF ###
###########

variable "waf_apigw_cloudwatch_metrics_enabled" {
  type = bool
}

variable "waf_apigw_sampled_requests_enabled" {
  type = bool
}

variable "waf_apigw_bot_control_inspection_level" {
  type = string
}

variable "waf_alb_cloudwatch_metrics_enabled" {
  type = bool
}

variable "waf_alb_sampled_requests_enabled" {
  type = bool
}

variable "waf_alb_bot_control_inspection_level" {
  type = string
}

variable "rebuild_ecs_alb" {
  type = string
}

variable "notification_ecs_alb" {
  type = string
}

variable "safe_sense_ecs_alb" {
  type = string
}

variable "api_se_ecs_alb" {
  type = string
}