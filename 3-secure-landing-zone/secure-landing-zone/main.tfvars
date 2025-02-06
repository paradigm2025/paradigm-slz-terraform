folders = {
  shared = {
    org           = "organizations/417981694507"
    folder_name   = ["fldr-paradigm-shared-services"]
  }
  rd = {
    org           = "organizations/417981694507"
    folder_name   = ["fldr-research-and-development"]
  }
  portfolio = {
    org           = "organizations/417981694507"
    folder_name   = ["fldr-portfolio-mgmt"]
  },
  admin = {
    org           = "organizations/417981694507"
    folder_name   = ["fldr-admin"]
  }
}

shared_sub_folders            = ["fldr-paradigm-ss-nonprod", "fldr-paradigm-ss-prod"]
rd_sub_folders                = ["fldr-rd-dev"]
portfolio_sub_folders         = ["fldr-portfolio-mgmt-dev"]
admin_sub_folders             = ["fldr-admin-prod"]

billing_account = "01FDCB-EB1BB1-59378C"
org_id          = "417981694507"

projects = {
  "prj-rd-dev" = {
    project_name        = "prj-rd-dev"
    disable_services_on_destroy  = false
    folder_id          = "folders/45067345488"
    activate_apis      = [
      "compute.googleapis.com",
      "artifactregistry.googleapis.com",
      "oslogin.googleapis.com",
      "servicenetworking.googleapis.com",
      "cloudbuild.googleapis.com",
      "cloudidentity.googleapis.com",
      "cloudshell.googleapis.com",
      "endpoints.googleapis.com",
      "iam.googleapis.com",
      "iamcredentials.googleapis.com",
      "logging.googleapis.com",
      "networkmanagement.googleapis.com",
      "stackdriver.googleapis.com",
      "storage-component.googleapis.com",
      "vpcaccess.googleapis.com",
    ]
    project_labels     = {
      env  = "dev"
      proj = "rd"
    }
    bucket_name        = "research-and-development-bucket"
    bucket_location    = "US"
    project_sa_name    = "research-and-development-sa"
    sa_role            = "roles/viewer"
  },
  "prj-pm-dev" = {
    project_name        = "prj-pm-dev"
    disable_services_on_destroy  = false
    folder_id          = "folders/828850709455"
    activate_apis      = [
      "compute.googleapis.com",
      "artifactregistry.googleapis.com",
      "oslogin.googleapis.com",
      "servicenetworking.googleapis.com",
      "cloudbuild.googleapis.com",
      "cloudidentity.googleapis.com",
      "cloudshell.googleapis.com",
      "endpoints.googleapis.com",
      "iam.googleapis.com",
      "iamcredentials.googleapis.com",
      "logging.googleapis.com",
      "networkmanagement.googleapis.com",
      "stackdriver.googleapis.com",
      "storage-component.googleapis.com",
      "vpcaccess.googleapis.com",
    ]
    project_labels     = {
      env  = "dev"
      proj = "pm"
    }
    bucket_name        = "portfolio-mgmt-bucket"
    bucket_location    = "US"
    project_sa_name    = "portfolio-mgmt-sa"
    sa_role            = "roles/viewer"
  },
   "prj-pm-prod" = {
    project_name        = "prj-pm-prod"
    disable_services_on_destroy  = false
    folder_id          = "folders/828850709455"
    activate_apis      = [
      "compute.googleapis.com",
      "artifactregistry.googleapis.com",
      "oslogin.googleapis.com",
      "servicenetworking.googleapis.com",
      "cloudbuild.googleapis.com",
      "cloudidentity.googleapis.com",
      "cloudshell.googleapis.com",
      "endpoints.googleapis.com",
      "iam.googleapis.com",
      "iamcredentials.googleapis.com",
      "logging.googleapis.com",
      "networkmanagement.googleapis.com",
      "stackdriver.googleapis.com",
      "storage-component.googleapis.com",
      "vpcaccess.googleapis.com",
    ]
    project_labels     = {
      env  = "prod"
      proj = "pm"
    }
    bucket_name        = "portfolio-mgmt-bucket"
    bucket_location    = "US"
    project_sa_name    = "portfolio-mgmt-sa"
    sa_role            = "roles/viewer"
  },
   "prj-admins-prod" = {
    project_name        = "prj-admins-prod"
    disable_services_on_destroy  = false
    folder_id          = "folders/817510310297"
    activate_apis      = [
      "compute.googleapis.com",
      "artifactregistry.googleapis.com",
      "oslogin.googleapis.com",
      "servicenetworking.googleapis.com",
      "cloudbuild.googleapis.com",
      "cloudidentity.googleapis.com",
      "cloudshell.googleapis.com",
      "endpoints.googleapis.com",
      "iam.googleapis.com",
      "iamcredentials.googleapis.com",
      "logging.googleapis.com",
      "networkmanagement.googleapis.com",
      "stackdriver.googleapis.com",
      "storage-component.googleapis.com",
      "vpcaccess.googleapis.com",
    ]
    project_labels     = {
      env  = "prod"
      proj = "admins"
    }
    bucket_name        = "admins-bucket"
    bucket_location    = "US"
    project_sa_name    = "admins-sa"
    sa_role            = "roles/viewer"
  }
}