variable "projectName" {
  type = string
}

variable "org_id" {
  type    = string
}

variable "folder_id" {
  type = string
}

variable "random_project_id" {
  type = bool
  default = false
}

variable "labels" {
  type = map(any)
}

variable "billing_account" {
  type = string
}

variable "apis" {
  type        = list(string)
  description = "List of apis to enable inside of the project during creation"
  default = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "oslogin.googleapis.com",
    "privateca.googleapis.com",
    "servicenetworking.googleapis.com",
    "container.googleapis.com",
    "vpcaccess.googleapis.com",
  ]
}

variable "customRules" {
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

variable "module_depends_on" {
  description = "List of modules or resources this module depends on."
  type        = list(any)
  default     = []
}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = "(Optional) Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork. Valid values include: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS. Changing this forces a new NAT to be created."
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

variable "subnetworks" {
  type = list(object({
    name                     = string,
    source_ip_ranges_to_nat  = list(string)
    secondary_ip_range_names = list(string)
  }))
  default = []
}

variable "host_network" {
  description = "host_network"
  type        = any
}

variable "routes" {
  description = "routes"
  type        = any
}

variable "cloud-nat" {
  description = "cloud-nat"
  type        = any
}

variable "address" {
  description = "address"
  type        = any
}