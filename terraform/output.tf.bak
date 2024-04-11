  output "oidc_provider_arn" {
    value = module.eks.cluster_oidc_issuer_url
  }

  output "oidc_provider_id" {
  value = element(split(":", module.eks.cluster_oidc_issuer_url), 5)
}