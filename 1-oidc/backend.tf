terraform {
  backend "gcs" {
    bucket = "bootstrap-tfstate-deb5"
    prefix = "paradigm/slz/infra/1-oidc"
  }
}