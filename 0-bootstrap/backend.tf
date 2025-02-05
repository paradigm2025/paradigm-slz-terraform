terraform {
  backend "gcs" {
    bucket = "bootstrap-tfstate-deb5"
    prefix = "paradigm/slz/infra/0-bootstrap"
  }
}