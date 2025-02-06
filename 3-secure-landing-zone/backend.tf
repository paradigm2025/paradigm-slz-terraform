terraform {
  backend "gcs" {
    bucket = "bootstrap-tfstate-deb5"
    prefix = "slz/infra/3-secure-landing-zone"
  }
}