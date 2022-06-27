resource "aws_lb" "application_elb" {
  name               = var.application_elb_name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = var.application_elb_security_groups
  subnets            = var.application_elb_subnets

  enable_deletion_protection = false
  #  access_logs {
  #    bucket  = aws_s3_bucket.lb_logs.bucket
  #    prefix  = "test-lb"
  #    enabled = true
  #  }
  tags = var.local_tags
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.application_elb.id
  port              = var.port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
  tags = var.local_tags
}