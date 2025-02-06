terraform {
  backend "gcs" {
    bucket = "bootstrap-tfstate-deb5"
    prefix = "slz/infra/2-org-policies"
  }
}