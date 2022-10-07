output "secret_key" {
  value = aws_iam_access_key.user_access_key.secret
}


output "access_key" {
  value = aws_iam_access_key.user_access_key.id
}