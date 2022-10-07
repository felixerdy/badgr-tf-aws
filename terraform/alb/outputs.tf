output "alb_endpoint" {
  value = aws_lb.web.dns_name
}