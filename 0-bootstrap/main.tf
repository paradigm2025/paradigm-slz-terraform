module "folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 4.0"

  parent = var.org
  names  = var.folder_name
}

module "bootstrap" {
  source  = "terraform-google-modules/bootstrap/google"
  version = "~> 6.4"

  org_id                  = var.organization_id
  billing_account         = var.billing_account_id
  group_org_admins        = var.group_org_admins
  group_billing_admins    = var.group_billing_admins
  default_region          = var.default_region
  activate_apis           = var.activate_apis
  create_terraform_sa     = var.create_terraform_sa
  folder_id               = module.folders.id
  project_id              = var.project_id
  project_labels          = var.project_labels
  project_prefix          = var.project_prefix
  sa_org_iam_permissions  = var.sa_org_iam_permissions
  state_bucket_name       = var.state_bucket_name
  storage_bucket_labels   = var.storage_bucket_labels
  tf_service_account_id   = var.tf_service_account_id
  tf_service_account_name = var.tf_service_account_name
}