resource "aws_iam_role_policy" "example_sts_policy" {
  name = "example-sts-policy"
role = aws_iam_role.example_role.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "oidc.eks.us-east-1.amazonaws.com/id/${element(split("/", module.eks.cluster_oidc_issuer_url), 4)}:aud" = "sts.amazonaws.com"
            "oidc.eks.us-east-1.amazonaws.com/id/${element(split("/", module.eks.cluster_oidc_issuer_url), 4)}:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })
}