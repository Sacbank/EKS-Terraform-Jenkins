resource "aws_iam_policy_attachment" "example_attachment" {
  name       = "example-attachment"
roles = [aws_iam_role.example_role.name]
  policy_arn = aws_iam_policy.example_policy.arn
}