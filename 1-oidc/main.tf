module "gh_oidc" {
  source       = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version      = "3.1.2"
  project_id   = var.project_id
  pool_id      = var.pool_id
  provider_id  = var.provider_id
  issuer_uri   = var.issuer_uri
  sa_mapping = {
    (var.sa_account_id) = {
      sa_name   = var.sa_account_name
      attribute = var.attribute
    }
  }
  attribute_condition = var.attribute_condition
}