module "folders" {
  source                    = "terraform-google-modules/folders/google"
  version                   = "~> 4.0"

  for_each                  = var.folders
  parent                    = each.value.org
  names                     = each.value.folder_name
}

module "shared_services_sub_folders" {
  source                    = "terraform-google-modules/folders/google"
  version                   = "~> 4.0"

  parent                    = module.folders["shared"].id
  names                     = var.shared_sub_folders
}

module "rd_sub_folders" {
  source                    = "terraform-google-modules/folders/google"
  version                   = "~> 4.0"

  parent                    = module.folders["rd"].id
  names                     = var.rd_sub_folders
}

module "portfolio_sub_folders" {
  source                    = "terraform-google-modules/folders/google"
  version                   = "~> 4.0"

  parent                    = module.folders["portfolio"].id
  names                     = var.portfolio_sub_folders
}

module "admin_sub_folders" {
  source                    = "terraform-google-modules/folders/google"
  version                   = "~> 4.0"

  parent                    = module.folders["admin"].id
  names                     = var.admin_sub_folders
}

module "nonprod_host_project" {
  source                    = "../modules/host-project-factory"
  org_id                    = var.org_id
  projectName               = var.projectName["nonprod_host"]
  random_project_id         = false
  labels                    = var.nonprod_host_proj_labels
  apis                      = var.apis
  folder_id                 = module.shared_services_sub_folders.folders_map["fldr-paradigm-ss-nonprod"].id
  billing_account           = var.billing_account
  host_network              = var.nonprod_host_network
  customRules               = var.firewall_nonprod
  address                   = var.address
  cloud-nat                 = var.cloud_nat_nonprod
  routes                    = var.routes_nonprod
}

module "prod_host_project" {
  source                    = "../modules/host-project-factory"
  org_id                    = var.org_id
  projectName               = var.projectName["prod_host"]
  random_project_id         = false
  labels                    = var.prod_host_proj_labels
  apis                      = var.apis
  folder_id                 = module.shared_services_sub_folders.folders_map["fldr-paradigm-ss-prod"].id
  billing_account           = var.billing_account
  host_network              = var.prod_host_network
  customRules               = var.firewall_prod
  address                   = var.address
  cloud-nat                 = var.cloud_nat_prod 
  routes                    = var.routes_prod
}

module "projects" {
  source                       = "terraform-google-modules/project-factory/google"
  version                      = "~> 14.3"

  for_each                     = var.projects
  name                         = each.value.project_name
  disable_services_on_destroy  = each.value.disable_services_on_destroy
  folder_id                    = each.value.folder_id
  org_id                       = var.org_id
  billing_account              = var.billing_account
  project_id                   = each.value.project_name
  activate_apis                = each.value.activate_apis
  labels                       = each.value.project_labels
  bucket_name                  = each.value.bucket_name
  bucket_location              = each.value.bucket_location
  project_sa_name              = each.value.project_sa_name
  sa_role                      = each.value.sa_role
}

