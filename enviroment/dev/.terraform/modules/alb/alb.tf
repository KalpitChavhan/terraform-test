resource "aws_lb" "alb" {
  name               = "${var.env}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnets

  security_groups = [var.sg_id]

  tags = {
    Environment = var.env
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "${var.env}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_alb_target_group_attachment" "attach" {
  count = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id = var.instance_ids[count.index]
  port = 80
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}