resource "aws_iam_access_key" "user_access_key" {
  user    = aws_iam_user.user.name
}

resource "aws_iam_user" "user" {
  name = "badgr-aws-user"
}

resource "aws_iam_policy" "ses_full_access" {
  name        = "ses_full_access"

  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
            Effect: "Allow",
            Action: [
                "ses:*"
            ],
            Resource: "*"
        },
        {
            Effect: "Allow",
            Action: [
              "sns:*"
            ],
            Resource: "*"
        }
    ]
  })
}

resource "aws_iam_policy" "s3_full_access" {
  name        = "s3_full_access"

  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
            Effect: "Allow",
            Action: [
                "s3:*"
            ],
            Resource: "*"
        }
    ]
  })
}

resource "aws_iam_policy_attachment" "attach_ses_policy" {
  name       = "ses_policy_attachment"
  users      = [aws_iam_user.user.name]
  policy_arn = aws_iam_policy.ses_full_access.arn
}

resource "aws_iam_policy_attachment" "attach_s3_policy" {
  name       = "s3_policy_attachment"
  users      = [aws_iam_user.user.name]
  policy_arn = aws_iam_policy.s3_full_access.arn
}