output "elb_dns" {
  value = aws_elb.badgr_elb.dns_name
}

output "elb_sg" {
  value = aws_security_group.elb_sg
}
