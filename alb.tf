resource "aws_lb" "public" {
  name               = "${var.ENV}-public-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb-sg.id]
  subnets            = data.terraform_remote_state.vpc.outputs.PUBLIC_SUBNETS

  tags = merge(tomap({
    "Name" = "${local.tags.Service}-${local.Environment}-${local.env_tag.appenv}-public-elb"
  }), local.tags)
}

resource "aws_lb" "private" {
  name               = "${var.ENV}-private-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb-sg.id]
  subnets            = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNETS

  tags = merge(tomap({
    "Name" = "${local.tags.Service}-${local.Environment}-${local.env_tag.appenv}-private-elb"
  }), local.tags)
}

resource "aws_lb_listener" "private" {
  load_balancer_arn = aws_lb.private.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "OK"
      status_code  = "200"
    }
  }
}

