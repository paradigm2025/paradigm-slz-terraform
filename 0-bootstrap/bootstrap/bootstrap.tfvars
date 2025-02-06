org                                               = "organizations/417981694507"
folder_name                                       = ["fldr-bootstrap"]
organization_id                                   = "417981694507"    
billing_account_id                                = "01FDCB-EB1BB1-59378C"
group_org_admins                                  = "gcp-organization-admins@paradigmasset.com"
group_billing_admins                              = "gcp-billing-admins@paradigmasset.com"
default_region                                    = "US"
activate_apis                                     = [
  "serviceusage.googleapis.com",
  "servicenetworking.googleapis.com",
  "cloudkms.googleapis.com",
  "compute.googleapis.com",
  "cloudidentity.googleapis.com",
  "logging.googleapis.com",
  "bigquery.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "cloudbilling.googleapis.com",
  "cloudbuild.googleapis.com",
  "iam.googleapis.com",
  "admin.googleapis.com",
  "appengine.googleapis.com",
  "storage-api.googleapis.com",
  "storage-component.googleapis.com",
  "monitoring.googleapis.com",
  "pubsub.googleapis.com",
  "securitycenter.googleapis.com",
  "accesscontextmanager.googleapis.com",
  "billingbudgets.googleapis.com",
  //"essentialcontacts.googleapis.com"
]
create_terraform_sa                                  = true
project_id                                           = "prj-paradigm-seed"
project_labels                                       = {
  "environment"       = "bootstrap"
  "application_name"  = "seed"
}
project_prefix                                       = "paradigm"
sa_org_iam_permissions                               = [
  "roles/accesscontextmanager.policyAdmin",
  "roles/billing.user",
  "roles/compute.networkAdmin",
  "roles/compute.xpnAdmin",
  "roles/iam.securityAdmin",
  "roles/iam.serviceAccountAdmin",
  "roles/logging.configWriter",
  "roles/logging.viewer",
  "roles/orgpolicy.policyAdmin",
  "roles/resourcemanager.projectCreator",
  "roles/resourcemanager.folderAdmin",
  "roles/securitycenter.notificationConfigEditor",
  "roles/resourcemanager.organizationViewer",
  "roles/serviceusage.serviceUsageConsumer",
  "roles/monitoring.editor",
  "roles/monitoring.viewer",
  "roles/logging.viewer",
  "roles/monitoring.admin",
  "roles/monitoring.metricsScopesAdmin",
  "roles/storage.admin", 
  "roles/resourcemanager.projectIamAdmin", 
  "roles/iam.workloadIdentityPoolAdmin", 
  "roles/iam.serviceAccountAdmin", 
  "roles/iam.serviceAccountUser", 
  "roles/serviceusage.serviceUsageAdmin", 
  "roles/compute.networkAdmin", 
  "roles/compute.instanceAdmin", 
  "roles/compute.securityAdmin", 
]
state_bucket_name                                    = "bootstrap-tfstate"
storage_bucket_labels                                = {}
tf_service_account_id                                = "org-terraform"
tf_service_account_name                              = "Organization Terraform Account"