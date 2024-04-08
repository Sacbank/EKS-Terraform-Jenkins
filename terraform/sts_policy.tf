resource "aws_iam_role_policy" "example_sts_policy" {
  name   = "example-sts-policy"
role = aws_iam_role.example_role.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
            Federated = "arn:aws:iam::945117034000:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/82168A1519811F986D06E6D9F0357817"
        }
        Action    = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "oidc.eks.us-east-1.amazonaws.com/id/82168A1519811F986D06E6D9F0357817:aud" = "sts.amazonaws.com"
            "oidc.eks.us-east-1.amazonaws.com/id/82168A1519811F986D06E6D9F0357817:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })
}