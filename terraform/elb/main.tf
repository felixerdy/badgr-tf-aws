resource "aws_security_group" "elb_sg" {
  name        = "terraform_alb_security_group"
  description = "Terraform load balancer security group"
  vpc_id      = var.vpc

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "badgr_elb" {
  name            = "terraform-elb"
  subnets         = var.subnets
  security_groups = [aws_security_group.elb_sg.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 15
    target              = "HTTP:80/health"
    interval            = 60
  }

  instances                   = var.ec2_instance_ids
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}

resource "aws_app_cookie_stickiness_policy" "elb_cookie_stickiness" {
  name          = "elb-cookie-stickiness"
  load_balancer = aws_elb.badgr_elb.name
  lb_port       = 80
  cookie_name   = "sessionid"
}
