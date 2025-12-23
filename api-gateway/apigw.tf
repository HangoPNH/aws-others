data "aws_api_gateway_domain_name" "api_gateway_domain_name" {
  domain_name = var.api_gateway_domain
}

resource "aws_api_gateway_rest_api" "api_gateway_rest_api" {
  body = file("${var.json_template}")
  name = "${var.project_key_tag}-apigw-${var.region_name}-${var.infra_env}"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-apigw-rest-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_api_gateway_deployment" "aws_api_gateway_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway_rest_api.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.api_gateway_rest_api.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

### ver 1 ###
resource "aws_api_gateway_stage" "aws_api_gateway_stage_v1" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway_rest_api.id
  deployment_id = aws_api_gateway_deployment.aws_api_gateway_deployment.id
  stage_name    = var.apigw_v1
  variables = {
    REBUILD_BE_API_VERSION = var.apigw_v1
    REBUILD_BE_ENDPOINT    = var.rebuild_alb_endpoint
    REBUILD_BE_REST_PORT   = var.rebuild_be_rest_port
    API_SE_API_VERSION     = var.apigw_v1
    API_SE_ENDPOINT        = var.api_se_alb_endpoint
    API_SE_REST_PORT       = var.api_se_rest_port
    SS_BE_API_VERSION      = var.apigw_v1
    SS_BE_ENDPOINT         = var.safesense_alb_endpoint
    SS_BE_REST_PORT        = var.safesense_be_rest_port
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-apigw-stage${var.apigw_v1}-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_apigatewayv2_api_mapping" "aws_apigatewayv2_api_mapping_v1" {
  domain_name     = data.aws_api_gateway_domain_name.api_gateway_domain_name.id
  api_id          = aws_api_gateway_rest_api.api_gateway_rest_api.id
  stage           = aws_api_gateway_stage.aws_api_gateway_stage_v1.stage_name
  api_mapping_key = "api/v1"
}

### ver 2 ###
resource "aws_api_gateway_stage" "aws_api_gateway_stage_v2" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway_rest_api.id
  deployment_id = aws_api_gateway_deployment.aws_api_gateway_deployment.id
  stage_name    = var.apigw_v2
  variables = {
    REBUILD_BE_API_VERSION = var.apigw_v2
    REBUILD_BE_ENDPOINT    = var.rebuild_alb_endpoint
    REBUILD_BE_REST_PORT   = var.rebuild_be_rest_port
    API_SE_API_VERSION     = var.apigw_v1
    API_SE_ENDPOINT        = var.api_se_alb_endpoint
    API_SE_REST_PORT       = var.api_se_rest_port
    SS_BE_API_VERSION      = var.apigw_v2
    SS_BE_ENDPOINT         = var.safesense_alb_endpoint
    SS_BE_REST_PORT        = var.safesense_be_rest_port
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-apigw-stage${var.apigw_v2}-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_apigatewayv2_api_mapping" "aws_apigatewayv2_api_mapping_v2" {
  domain_name     = data.aws_api_gateway_domain_name.api_gateway_domain_name.id
  api_id          = aws_api_gateway_rest_api.api_gateway_rest_api.id
  stage           = aws_api_gateway_stage.aws_api_gateway_stage_v2.stage_name
  api_mapping_key = "api/v2"
}

### ver 3 ###
resource "aws_api_gateway_stage" "aws_api_gateway_stage_v3" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway_rest_api.id
  deployment_id = aws_api_gateway_deployment.aws_api_gateway_deployment.id
  stage_name    = var.apigw_v3
  variables = {
    REBUILD_BE_API_VERSION = var.apigw_v3
    REBUILD_BE_ENDPOINT    = var.rebuild_alb_endpoint
    REBUILD_BE_REST_PORT   = var.rebuild_be_rest_port
    API_SE_API_VERSION     = var.apigw_v1
    API_SE_ENDPOINT        = var.api_se_alb_endpoint
    API_SE_REST_PORT       = var.api_se_rest_port
    SS_BE_API_VERSION      = var.apigw_v3
    SS_BE_ENDPOINT         = var.safesense_alb_endpoint
    SS_BE_REST_PORT        = var.safesense_be_rest_port
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-apigw-stage${var.apigw_v3}-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_apigatewayv2_api_mapping" "aws_apigatewayv2_api_mapping_v3" {
  domain_name     = data.aws_api_gateway_domain_name.api_gateway_domain_name.id
  api_id          = aws_api_gateway_rest_api.api_gateway_rest_api.id
  stage           = aws_api_gateway_stage.aws_api_gateway_stage_v3.stage_name
  api_mapping_key = "api/v3"
}

### ver 4 ###
resource "aws_api_gateway_stage" "aws_api_gateway_stage_v4" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway_rest_api.id
  deployment_id = aws_api_gateway_deployment.aws_api_gateway_deployment.id
  stage_name    = var.apigw_v4
  variables = {
    REBUILD_BE_API_VERSION = var.apigw_v4
    REBUILD_BE_ENDPOINT    = var.rebuild_alb_endpoint
    REBUILD_BE_REST_PORT   = var.rebuild_be_rest_port
    API_SE_API_VERSION     = var.apigw_v1
    API_SE_ENDPOINT        = var.api_se_alb_endpoint
    API_SE_REST_PORT       = var.api_se_rest_port
    SS_BE_API_VERSION      = var.apigw_v4
    SS_BE_ENDPOINT         = var.safesense_alb_endpoint
    SS_BE_REST_PORT        = var.safesense_be_rest_port
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-apigw-stage${var.apigw_v4}-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_apigatewayv2_api_mapping" "aws_apigatewayv2_api_mapping_v4" {
  domain_name     = data.aws_api_gateway_domain_name.api_gateway_domain_name.id
  api_id          = aws_api_gateway_rest_api.api_gateway_rest_api.id
  stage           = aws_api_gateway_stage.aws_api_gateway_stage_v4.stage_name
  api_mapping_key = "api/v4"
}

### ver 5 ###
resource "aws_api_gateway_stage" "aws_api_gateway_stage_v5" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway_rest_api.id
  deployment_id = aws_api_gateway_deployment.aws_api_gateway_deployment.id
  stage_name    = var.apigw_v5
  variables = {
    REBUILD_BE_API_VERSION = var.apigw_v5
    REBUILD_BE_ENDPOINT    = var.rebuild_alb_endpoint
    REBUILD_BE_REST_PORT   = var.rebuild_be_rest_port
    API_SE_API_VERSION     = var.apigw_v1
    API_SE_ENDPOINT        = var.api_se_alb_endpoint
    API_SE_REST_PORT       = var.api_se_rest_port
    SS_BE_API_VERSION      = var.apigw_v5
    SS_BE_ENDPOINT         = var.safesense_alb_endpoint
    SS_BE_REST_PORT        = var.safesense_be_rest_port
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-apigw-stage${var.apigw_v5}-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_apigatewayv2_api_mapping" "aws_apigatewayv2_api_mapping_v5" {
  domain_name     = data.aws_api_gateway_domain_name.api_gateway_domain_name.id
  api_id          = aws_api_gateway_rest_api.api_gateway_rest_api.id
  stage           = aws_api_gateway_stage.aws_api_gateway_stage_v5.stage_name
  api_mapping_key = "api/v5"
}

################
### VPC link ###
################

### NLB ###
resource "aws_api_gateway_vpc_link" "aws_api_gateway_restapi_vpc_link" {
  name        = "${var.rest_private}-${var.region_name}-${var.infra_env}"
  description = "VPC Private link for Rest API"
  target_arns = [aws_lb.rest_private_nlb.arn]

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.rest_private}-${var.region_name}-${var.infra_env}"
    }
  )
}
