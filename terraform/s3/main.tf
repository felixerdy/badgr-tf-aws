resource "aws_s3_bucket_acl" "public_bucket_acl" {
  bucket = aws_s3_bucket.default.id
  acl    = "public-read"
}

resource "aws_s3_bucket" "default" {
  bucket = "badgr-s3"
  force_destroy = true
}