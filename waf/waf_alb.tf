# define waf web acl
resource "aws_wafv2_web_acl" "ciac_alb_waf_web_acl" {
  name        = "${var.project_key_tag}-alb-web-acl-${var.region_name}-${var.infra_env}"
  description = "WAF Web ACL for ALB"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  association_config {
    request_body {
      api_gateway {
        default_size_inspection_limit = "KB_32"
      }
    }
  }

  #1 Amazon IP reputation list
  rule {
    name     = "AWSManagedRulesAmazonIpReputationList"
    priority = 0

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.waf_alb_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesAmazonIpReputationList"
      sampled_requests_enabled   = var.waf_alb_sampled_requests_enabled
    }
  }

  #2 XSS and other common threats
  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 1

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"

        rule_action_override {
          name = "SizeRestrictions_BODY"
          action_to_use {
            count {}
          }
        }

        rule_action_override {
          name = "GenericRFI_BODY"
          action_to_use {
            count {}
          }
        }

        rule_action_override {
          name = "CrossSiteScripting_BODY"
          action_to_use {
            count {}
          }
        }
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.waf_alb_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = var.waf_alb_sampled_requests_enabled
    }
  }

  #3 Known Bad Inputs Rule Set
  rule {
    name     = "AWSManagedRulesKnownBadInputsRuleSet"
    priority = 2

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.waf_alb_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesKnownBadInputsRuleSet"
      sampled_requests_enabled   = var.waf_alb_sampled_requests_enabled
    }
  }


  #4 Bot Control Rule Set
  rule {
    name     = "AWSManagedRulesBotControlRuleSet"
    priority = 3

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesBotControlRuleSet"
        vendor_name = "AWS"

        # Define inspection level
        managed_rule_group_configs {
          aws_managed_rules_bot_control_rule_set {
            inspection_level = var.waf_alb_bot_control_inspection_level
          }
        }

        rule_action_override {
          name = "CategoryHttpLibrary"
          action_to_use {
            count {}
          }
        }

        rule_action_override {
          name = "SignalNonBrowserUserAgent"
          action_to_use {
            count {}
          }
        }
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.waf_alb_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesBotControlRuleSet"
      sampled_requests_enabled   = var.waf_alb_sampled_requests_enabled
    }
  }

  #5 Anonymous IP List
  rule {
    name     = "AWSManagedRulesAnonymousIpList"
    priority = 4

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAnonymousIpList"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.waf_alb_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesAnonymousIpList"
      sampled_requests_enabled   = var.waf_alb_sampled_requests_enabled
    }
  }

  #6 SQL Injection Protection
  rule {
    name     = "AWSManagedRulesSQLiRuleSet"
    priority = 5

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.waf_alb_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesSQLiRuleSet"
      sampled_requests_enabled   = var.waf_alb_sampled_requests_enabled
    }
  }

  #7 Rate Limiting Rule
  rule {
    name     = "CustomedRateLimit"
    priority = 6

    statement {
      rate_based_statement {
        limit              = 1000 # Max requests per 5 minutes
        aggregate_key_type = "IP"
      }
    }

    action {
      block {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.waf_alb_cloudwatch_metrics_enabled
      metric_name                = "CustomedRateLimit"
      sampled_requests_enabled   = var.waf_alb_sampled_requests_enabled
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = var.waf_alb_cloudwatch_metrics_enabled
    metric_name                = "${var.project_key_tag}-alb-web-acl-metric"
    sampled_requests_enabled   = var.waf_alb_sampled_requests_enabled
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-alb-waf-web-acl-${var.region_name}-${var.infra_env}"
    }
  )
}

# associate web acl to alb
resource "aws_wafv2_web_acl_association" "ciac_alb_waf_web_acl_association_rebuild" {
  resource_arn = data.aws_lb.rebuild_ecs_alb.arn
  web_acl_arn  = aws_wafv2_web_acl.ciac_alb_waf_web_acl.arn
}

resource "aws_wafv2_web_acl_association" "ciac_alb_waf_web_acl_association_notification" {
  resource_arn = data.aws_lb.notification_ecs_alb.arn
  web_acl_arn  = aws_wafv2_web_acl.ciac_alb_waf_web_acl.arn
}

resource "aws_wafv2_web_acl_association" "ciac_alb_waf_web_acl_association_safe_sense" {
  resource_arn = data.aws_lb.safe_sense_ecs_alb.arn
  web_acl_arn  = aws_wafv2_web_acl.ciac_alb_waf_web_acl.arn
}

resource "aws_wafv2_web_acl_association" "ciac_alb_waf_web_acl_association_api_se" {
  resource_arn = data.aws_lb.api_se_ecs_alb.arn
  web_acl_arn  = aws_wafv2_web_acl.ciac_alb_waf_web_acl.arn
}
