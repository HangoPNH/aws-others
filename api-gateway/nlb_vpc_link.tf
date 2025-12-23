resource "aws_lb" "rest_private_nlb" {
  name                       = "nlb-${var.rest_private}-${var.region_name}-${var.infra_env}"
  internal                   = true
  load_balancer_type         = "network"
  subnets                    = var.private_app_subnet_ids
  enable_deletion_protection = false

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-nlb-${var.rest_private}-${var.region_name}-${var.infra_env}"
    }
  )
}

### Map to Rebuild ALB ###
# create target group attaches rebuild alb
resource "aws_lb_target_group" "rebuild_alb_tg" {
  name        = "map-rebuild-alb-tg-${var.region_name}-${var.infra_env}"
  target_type = "alb"
  port        = 4000
  protocol    = "TCP"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/monitor/health-check"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_lb.rest_private_nlb]
}

# create a listener on port 4001 with forward action
resource "aws_lb_listener" "rebuild_alb_tg_http_listener" {
  load_balancer_arn = aws_lb.rest_private_nlb.arn
  port              = 4000
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rebuild_alb_tg.arn
  }
}

# Attach rest api private link target group to rebuild alb
resource "aws_lb_target_group_attachment" "rebuild_alb_tg_attachment" {
  target_group_arn = aws_lb_target_group.rebuild_alb_tg.arn
  # attach the ALB to this target group
  target_id = data.aws_lb.rebuild_ecs_alb.arn
  #  If the target type is alb, the targeted Application Load Balancer must have at least one listener whose port matches the target group port.
  port = 4000
}

### Map to API Side Effect ALB ###
# create target group attaches api-se alb
resource "aws_lb_target_group" "api_se_alb_tg" {
  name        = "map-api-se-alb-tg-${var.region_name}-${var.infra_env}"
  target_type = "alb"
  port        = 4002
  protocol    = "TCP"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/monitor/health-check"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_lb.rest_private_nlb]
}

# create a listener on port 4002 with forward action
resource "aws_lb_listener" "api_se_alb_tg_http_listener" {
  load_balancer_arn = aws_lb.rest_private_nlb.arn
  port              = 4002
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_se_alb_tg.arn
  }
}

# Attach rest api private link target group to api-se alb
resource "aws_lb_target_group_attachment" "api_se_alb_tg_attachment" {
  target_group_arn = aws_lb_target_group.api_se_alb_tg.arn
  # attach the ALB to this target group
  target_id = data.aws_lb.api_se_ecs_alb.arn
  # If the target type is alb, the targeted Application Load Balancer must have at least one listener whose port matches the target group port.
  port = 4002
}

### Map to SS BE ALB ###
# create target group attaches SS BE alb
resource "aws_lb_target_group" "ss_be_alb_tg" {
  name        = "ss-be-alb-tg-${var.region_name}-${var.infra_env}"
  target_type = "alb"
  port        = 3001
  protocol    = "TCP"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/monitor/health-check"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_lb.rest_private_nlb]
}

# create a listener on port 3001 with forward action
resource "aws_lb_listener" "ss_be_alb_tg_http_listener" {
  load_balancer_arn = aws_lb.rest_private_nlb.arn
  port              = 3001
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ss_be_alb_tg.arn
  }
}

# Attach rest api private link target group to safesense alb
resource "aws_lb_target_group_attachment" "ss_be_alb_tg_attachment" {
  target_group_arn = aws_lb_target_group.ss_be_alb_tg.arn
  # attach the ALB to this target group
  target_id = data.aws_lb.ss_ecs_alb.arn
  #  If the target type is alb, the targeted Application Load Balancer must have at least one listener whose port matches the target group port.
  port = 3001
}

### Map to SS AI ALB ###
# create target group attaches SS AI Video alb
resource "aws_lb_target_group" "ss_ai_video_alb_tg" {
  name        = "ss-ai-video-alb-tg-${var.region_name}-${var.infra_env}"
  target_type = "alb"
  port        = 3475
  protocol    = "TCP"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/monitor/health-check"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_lb.rest_private_nlb]
}

# create a listener on port 3475 with forward action
resource "aws_lb_listener" "ss_ai_video_alb_tg_http_listener" {
  load_balancer_arn = aws_lb.rest_private_nlb.arn
  port              = 3475
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ss_ai_video_alb_tg.arn
  }
}

# Attach rest api private link target group to safesense alb
resource "aws_lb_target_group_attachment" "ss_ai_video_alb_tg_attachment" {
  target_group_arn = aws_lb_target_group.ss_ai_video_alb_tg.arn
  # attach the ALB to this target group
  target_id = data.aws_lb.ss_ecs_alb.arn
  #  If the target type is alb, the targeted Application Load Balancer must have at least one listener whose port matches the target group port.
  port = 3475
}
