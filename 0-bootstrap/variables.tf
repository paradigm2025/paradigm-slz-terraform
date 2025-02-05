variable "org" {
  description = "The resource name of the parent Organization. Must be of the form organizations/org_id."
  type        = string
  default     = "organizations/501532389770"
}

variable "folder_name" {
  description = "Folder names."
  type        = list(string)
  default     = []
}

variable "organization_id" {
  description = "The resource name of the parent Organization. Must be of the form organizations/org_id."
  type        = string
  default     = "501532389770"
}

variable "billing_account_id" {
  description = "The ID of the billing account to associate projects with."
  type        = string
  default     = "012BCD-645CF4-0A318B"
}

variable "group_org_admins" {
  description = "Google Group for GCP Organization Administrators"
  type        = string
}

variable "group_billing_admins" {
  description = "Google Group for GCP Billing Administrators"
  type        = string
}

variable "default_region" {
  description = "Default region to create resources where applicable."
  type        = string
  default     = "us-central1"
}

variable "activate_apis" {
  description = "List of APIs to enable in the seed project."
  type        = list(string)
  default = [
    "serviceusage.googleapis.com",
    "servicenetworking.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "iam.googleapis.com",
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "storage-api.googleapis.com",
    "monitoring.googleapis.com"
  ]
}

variable "create_terraform_sa" {
  description = "If the Terraform service account should be created."
  type        = bool
  default     = true
}

variable "project_id" {
  description = "Custom project ID to use for project created. If not supplied, the default id is {project_prefix}-seed-{random suffix}."
  type        = string
  default     = ""
}

variable "project_labels" {
  description = "Labels to apply to the project."
  type        = map(string)
  default     = {}
}

variable "project_prefix" {
  description = "Name prefix to use for projects created."
  type        = string
  default     = "cft"
}

variable "sa_org_iam_permissions" {
  description = "List of permissions granted to Terraform service account across the GCP organization."
  type        = list(string)
  default = [
    "roles/accesscontextmanager.policyAdmin",
    "roles/billing.user",
    "roles/compute.networkAdmin",
    "roles/compute.xpnAdmin",
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/logging.configWriter",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.folderAdmin",
    "roles/securitycenter.notificationConfigEditor",
    "roles/resourcemanager.organizationViewer"
  ]
}

variable "state_bucket_name" {
  description = "Custom state bucket name. If not supplied, the default name is {project_prefix}-tfstate-{random suffix}."
  type        = string
  default     = ""
}

variable "storage_bucket_labels" {
  description = "Labels to apply to the storage bucket."
  type        = map(string)
  default     = {}
}

variable "tf_service_account_id" {
  description = "ID of service account for terraform in seed project"
  type        = string
  default     = "org-terraform"
}

variable "tf_service_account_name" {
  description = "Display name of service account for terraform in seed project"
  type        = string
  default     = "CFT Organization Terraform Account"
}