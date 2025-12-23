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

variable "json_template" {
  type = string
}

variable "api_gateway_domain" {
  type = string
}

variable "apigw_v1" {
  type        = string
  description = "API Gateway version"
}

variable "apigw_v2" {
  type        = string
  description = "API Gateway version"
}

variable "apigw_v3" {
  type        = string
  description = "API Gateway version"
}

variable "apigw_v4" {
  type        = string
  description = "API Gateway version"
}

variable "apigw_v5" {
  type        = string
  description = "API Gateway version"
}

### Rebuild ###
variable "rebuild_be_rest_port" {
  type = number
}

variable "rebuild_alb_endpoint" {
  type = string
}

### API Side Effect ###
variable "api_se_rest_port" {
  type = number
}

variable "api_se_alb_endpoint" {
  type = string
}

### Safesense ###
variable "safesense_alb_endpoint" {
  type = string
}

variable "safesense_be_rest_port" {
  type = number
}

###########
### ALB ###
###########

variable "rebuild_ecs_alb" {
  type = string
}

variable "api_se_ecs_alb" {
  type = string
}

variable "safesense_ecs_alb" {
  type = string
}

################
### VPC link ###
################

variable "rest_private" {
  type = string
}

variable "private_app_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

###########
### R53 ###
###########

variable "domain" {
  type = string
}
