output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

output "ec2_public_dns" {
  value = module.ec2.ec2_public_dns
}

output "db_endpoint" {
  value = module.db.db_endpoint
}

output "memcached_endpoint" {
  value = module.memcached.memcached_endpoint
}

output "s3_endpoint" {
  value = module.s3.s3_endpoint
}

output "secret_key" {
  sensitive = true
  value     = module.iam.secret_key
}

output "access_key" {
  value = module.iam.access_key
}