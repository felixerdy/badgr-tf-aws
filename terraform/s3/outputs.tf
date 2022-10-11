output "s3_endpoint" {
  value = aws_s3_bucket.default.bucket_domain_name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.default.bucket
}