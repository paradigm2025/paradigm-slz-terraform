module "host_project" {
  source                         = "terraform-google-modules/project-factory/google"
  version                        = "~> 14.4.0"
  name                           = var.projectName
  org_id                         = var.org_id
  billing_account                = var.billing_account
  bucket_versioning              = true
  activate_apis                  = var.apis
  folder_id                      = var.folder_id
  random_project_id              = var.random_project_id
  enable_shared_vpc_host_project = true
  labels                         = var.labels
}

module "host_network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 7.4.0"
  
  for_each                               = var.host_network
  project_id                             = module.host_project.project_id
  network_name                           = each.value.networkName
  routing_mode                           = "GLOBAL"
  auto_create_subnetworks                = false
  delete_default_internet_gateway_routes = false
  subnets                                = each.value.networkSubnets
  secondary_ranges                       = each.value.secondary_ranges

}

resource "google_compute_firewall" "custom" {
  for_each                = var.customRules
  name                    = each.key
  description             = each.value.description
  direction               = each.value.direction
  network                 = each.value.network_name
  project                 = module.host_project.project_id
  source_ranges           = each.value.direction == "INGRESS" ? each.value.ranges : null
  destination_ranges      = each.value.direction == "EGRESS" ? each.value.ranges : null
  source_tags             = each.value.use_service_accounts || each.value.direction == "EGRESS" ? null : each.value.sources
  source_service_accounts = each.value.use_service_accounts && each.value.direction == "INGRESS" ? each.value.sources : null
  target_tags             = each.value.use_service_accounts ? null : each.value.targets
  target_service_accounts = each.value.use_service_accounts ? each.value.targets : null
  disabled                = lookup(each.value.extra_attributes, "disabled", false)
  priority                = lookup(each.value.extra_attributes, "priority", 1000)

  dynamic "log_config" {
    for_each = lookup(each.value.extra_attributes, "flow_logs", true) ? [{
      metadata = lookup(each.value.extra_attributes, "flow_logs_metadata", "INCLUDE_ALL_METADATA")
    }] : []
    content {
      metadata = log_config.value.metadata
    }
  }

  dynamic "allow" {
    for_each = [for rule in each.value.rules : rule if each.value.action == "allow"]
    iterator = rule
    content {
      protocol = rule.value.protocol
      ports    = rule.value.ports
    }
  }

  dynamic "deny" {
    for_each = [for rule in each.value.rules : rule if each.value.action == "deny"]
    iterator = rule
    content {
      protocol = rule.value.protocol
      ports    = rule.value.ports
    }
  }
  depends_on = [
    module.host_network 
  ]
}

module "routes" {
  source            = "terraform-google-modules/network/google//modules/routes"
  version           = "~> 7.4.0"

  for_each          = var.routes 
  module_depends_on = [module.host_network]
  project_id        = module.host_project.project_id
  network_name      = each.value.network_name

  routes = each.value.routes
}

module "cloud-nat" {
  source                             = "../cloud-nat" 
  for_each                           = var.cloud-nat
  project_id                         = module.host_project.project_id
  region                             = each.value.nat_region
  router                             = each.value.cloud_router
  name                               = each.value.nat_name 
  nat_ips                            = each.value.ip_address
  min_ports_per_vm                   = "128"
  icmp_idle_timeout_sec              = "15"
  tcp_established_idle_timeout_sec   = "600"
  tcp_transitory_idle_timeout_sec    = "15"
  udp_idle_timeout_sec               = "15"
  network                            = each.value.network_name
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  subnetworks                        = var.subnetworks
  depends_on = [
    google_compute_address.nat, module.host_network 
  ]
  router_asn                         = each.value.router_asn
}


resource "google_compute_address" "nat" {
  for_each     = var.address
  project      = module.host_project.project_id
  address_type = "EXTERNAL"
  name         = each.value.address_name
  region       = each.value.address_region
}