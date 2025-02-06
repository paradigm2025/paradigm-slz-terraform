variable "folders" {
  type        = any
  description = "Folders names"
}

variable "shared_sub_folders" {
  type        = list(string)
  description = "shared Sub-Folders names"
  default     = []
}

variable "rd_sub_folders" {
  type        = list(string)
  description = "rd Sub-Folders names"
  default     = []
}

variable "portfolio_sub_folders" {
  type        = list(string)
  description = "portfolio Sub-Folders names"
  default     = []
}

variable "admin_sub_folders" {
  type        = list(string)
  description = "admin Sub-Folders names"
  default     = []
}

variable "org_id" {
  type = string
}

variable "billing_account" {
  type = string
}

variable "sa_role" {
  type    = string
  default = "roles/editor"
}

variable "apis" {
  type        = list(string)
  description = "List of apis to enable inside of the project during creation"
  default = [
    "compute.googleapis.com",
    "artifactregistry.googleapis.com",
    "oslogin.googleapis.com",
    "servicenetworking.googleapis.com",
    "container.googleapis.com",
    "bigquery.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudidentity.googleapis.com",
    "cloudshell.googleapis.com",
    "endpoints.googleapis.com",
    "gkeconnect.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "iap.googleapis.com",
    "logging.googleapis.com",
    "networkmanagement.googleapis.com",
    "stackdriver.googleapis.com",
    "storage-component.googleapis.com",
    "vpcaccess.googleapis.com",
  ]
}

variable "nonprod_host_proj_labels" {
  type = map(any)
}

variable "prod_host_proj_labels" {
  type = map(any)
}

variable "projectName" {
  type = map(any)
}

variable "firewall_nonprod" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = {}
  type = map(object({
    description          = string
    direction            = string
    network_name         = string
    action               = string # (allow|deny)
    ranges               = list(string)
    sources              = list(string)
    targets              = list(string)
    use_service_accounts = bool
    rules = list(object({
      protocol = string
      ports    = list(string)
    }))
    extra_attributes = map(string)
  }))
}

variable "firewall_prod" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = {}
  type = map(object({
    description          = string
    direction            = string
    network_name         = string
    action               = string # (allow|deny)
    ranges               = list(string)
    sources              = list(string)
    targets              = list(string)
    use_service_accounts = bool
    rules = list(object({
      protocol = string
      ports    = list(string)
    }))
    extra_attributes = map(string)
  }))
}

variable "nonprod_host_network" {
  description = "nonprod host network"
  type        = map(any)
}

variable "prod_host_network" {
  description = "prod host network"
  type        = map(any)
}

variable "routes_nonprod" {
  description = "routes for nonprod"
  type        = any
}

variable "routes_prod" {
  description = "routes for prod"
  type        = any
}

variable "cloud_nat_nonprod" {
  description = "cloud nat for nonprod"
  type        = any
}

variable "cloud_nat_prod" {
  description = "cloud nat for prod"
  type        = any
}

variable "address" {
  description = "address"
  type        = any
}