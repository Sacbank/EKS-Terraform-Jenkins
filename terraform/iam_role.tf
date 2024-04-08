resource "aws_iam_role" "example_role" {
  name               = "example-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::945117034000:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/${element(split("/", module.eks.cluster_oidc_issuer_url), 4)}"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "oidc.eks.us-east-1.amazonaws.com/id/${element(split("/", module.eks.cluster_oidc_issuer_url), 4)}:aud": "sts.amazonaws.com",
                    "oidc.eks.us-east-1.amazonaws.com/id/${element(split("/", module.eks.cluster_oidc_issuer_url), 4)}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
                }
            }
        }
    ]
}
EOF
}
