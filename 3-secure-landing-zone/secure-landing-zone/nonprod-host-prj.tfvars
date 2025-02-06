org_id     = "417981694507"

projectName = {
  nonprod_host = "paradigm-ss-nonprod",
  prod_host    = "paradigm-ss-prod"
}

nonprod_host_proj_labels = {
  env  = "non-prod"
  proj = "host"
}

prod_host_proj_labels = {
  env  = "prod"
  proj = "host"
}

apis = [
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

nonprod_host_network = {
  paradigm-vpc-nonprod = {
    networkName = "paradigm-vpc-nonprod"
    networkSubnets = [
      {
        subnet_name                = "paradigm-sub-nonprod"
        subnet_ip                  = "10.0.0.0/24"
        subnet_region              = "us-east1"
        subnet_private_access      = "true"
        subnet_flow_logs           = "true"
        private_ipv6_google_access = "true"
        description                = "nonprod us-east1 network"
        subnet_flow_logs_interval  = "INTERVAL_10_MIN"
        private_ip_google_access   = "true"
        subnet_private_access      = "true"
        subnet_flow_logs_sampling  = 0.7
        subnet_flow_logs_metadata  = "INCLUDE_ALL_METADATA"
      },
      {
        subnet_name                = "paradigm-dr-sub-nonprod"
        subnet_ip                  = "10.100.0.0/24"
        subnet_region              = "us-central1"
        subnet_private_access      = "true"
        subnet_flow_logs           = "true"
        private_ipv6_google_access = "true"
        description                = "dr-nonprod us-central1 network"
        subnet_flow_logs_interval  = "INTERVAL_10_MIN"
        private_ip_google_access   = "true"
        subnet_private_access      = "true"
        subnet_flow_logs_sampling  = 0.7
        subnet_flow_logs_metadata  = "INCLUDE_ALL_METADATA"
      }
    ]
    secondary_ranges = {}
  }
}

prod_host_network = {
  paradigm-vpc-prod = {
    networkName = "paradigm-vpc-prod"
    networkSubnets = [
      {
        subnet_name                = "paradigm-sub-prod"
        subnet_ip                  = "10.0.1.0/24"
        subnet_region              = "us-east1"
        subnet_private_access      = "true"
        subnet_flow_logs           = "true"
        private_ipv6_google_access = "true"
        description                = "prod us-east1 network"
        subnet_flow_logs_interval  = "INTERVAL_10_MIN"
        private_ip_google_access   = "true"
        subnet_private_access      = "true"
        subnet_flow_logs_sampling  = 0.7
        subnet_flow_logs_metadata  = "INCLUDE_ALL_METADATA"
      },
      {
        subnet_name                = "paradigm-dr-sub-prod"
        subnet_ip                  = "10.100.1.0/24"
        subnet_region              = "us-central1"
        subnet_private_access      = "true"
        subnet_flow_logs           = "true"
        private_ipv6_google_access = "true"
        description                = "dr-prod us-central1 network"
        subnet_flow_logs_interval  = "INTERVAL_10_MIN"
        private_ip_google_access   = "true"
        subnet_private_access      = "true"
        subnet_flow_logs_sampling  = 0.7
        subnet_flow_logs_metadata  = "INCLUDE_ALL_METADATA"
      }
    ]
    secondary_ranges = {}
  }
}

firewall_nonprod = {
  default-allow-internal = {
    description          = "Permits incoming connections to VM instances from other instances within the same VPC network"
    direction            = "INGRESS"
    network_name         = "projects/paradigm-ss-nonprod/global/networks/paradigm-vpc-nonprod"
    action               = "allow"
    ranges               = ["10.0.1.0/24","10.100.1.0/24"]
    sources              = []
    targets              = []
    use_service_accounts = false
    rules = [
      {
        protocol = "all"
        ports    = []
      },
    ]
    extra_attributes = {}
  },
  gcp-iap-desktop = {
    description          = "GCP IAP Check Probes"
    direction            = "INGRESS"
    network_name         = "projects/paradigm-ss-nonprod/global/networks/paradigm-vpc-nonprod"
    action               = "allow"
    ranges               = ["35.235.240.0/20"]
    sources              = []
    targets              = []
    use_service_accounts = false
    rules = [
      {
        protocol = "tcp"
        ports    = ["22"]
      },
    ]
    extra_attributes = {}
  }
}

firewall_prod = {
  default-allow-internal = {
    description          = "Permits incoming connections to VM instances from other instances within the same VPC network"
    direction            = "INGRESS"
    network_name         = "projects/paradigm-ss-prod/global/networks/paradigm-vpc-prod"
    action               = "allow"
    ranges               = ["10.0.1.0/24","10.100.1.0/24"]
    sources              = []
    targets              = []
    use_service_accounts = false
    rules = [
      {
        protocol = "all"
        ports    = []
      },
    ]
    extra_attributes = {}
  },
  gcp-iap-desktop = {
    description          = "GCP IAP Check Probes"
    direction            = "INGRESS"
    network_name         = "projects/paradigm-ss-prod/global/networks/paradigm-vpc-prod"
    action               = "allow"
    ranges               = ["35.235.240.0/20"]
    sources              = []
    targets              = []
    use_service_accounts = false
    rules = [
      {
        protocol = "tcp"
        ports    = ["22"]
      },
    ]
    extra_attributes = {}
  }
}

address = {
  address1 = {
    address_name   = "ext-ip-us-east1"
    address_region = "us-east1"
  },
  address2 = {
    address_name   = "ext-ip-us-central1"
    address_region = "us-central1"
  }
}

cloud_nat_nonprod = {
  gcp-nat-east1 = {
    nat_name     = "gcp-nat-useast1"
    nat_region   = "us-east1"
    ip_address   = ["projects/paradigm-ss-nonprod/regions/us-east1/addresses/ext-ip-us-east1"]
    cloud_router = "gcp-nat-cr-useast1"
    network_name = "projects/paradigm-ss-nonprod/global/networks/paradigm-vpc-nonprod"
    router_asn   = "64515"
  },
 gcp-nat-uscentral1 = {
    nat_name     = "gcp-nat-uscentral1"
    nat_region   = "us-central1"
    ip_address   = ["projects/paradigm-ss-nonprod/regions/us-central1/addresses/ext-ip-us-central1"]
    cloud_router = "gcp-nat-cr-uscentral1"
    network_name = "projects/paradigm-ss-nonprod/global/networks/paradigm-vpc-nonprod"
    router_asn   = "64516"
  }
}

cloud_nat_prod = {
  gcp-nat-east1 = {
    nat_name     = "gcp-nat-useast1"
    nat_region   = "us-east1"
    ip_address   = ["projects/paradigm-ss-prod/regions/us-east1/addresses/ext-ip-us-east1"]
    cloud_router = "gcp-nat-cr-useast1"
    network_name = "projects/paradigm-ss-prod/global/networks/paradigm-vpc-prod"
    router_asn   = "64515"
  },
 gcp-nat-uscentral1 = {
    nat_name     = "gcp-nat-uscentral1"
    nat_region   = "us-central1"
    ip_address   = ["projects/paradigm-ss-prod/regions/us-central1/addresses/ext-ip-us-central1"]
    cloud_router = "gcp-nat-cr-uscentral1"
    network_name = "projects/paradigm-ss-prod/global/networks/paradigm-vpc-prod"
    router_asn   = "64516"
  }
}

routes_nonprod = {
  route1 = {
    network_name = "projects/paradigm-ss-nonprod/global/networks/paradigm-vpc-nonprod"
    routes = [
      {
        name              = "gcp-cr-route1"
        destination_range = "0.0.0.0/0"
        next_hop_internet = "true"
        priority          = "100"
      }
    ]
  }
}

routes_prod = {
  route1 = {
    network_name = "projects/paradigm-ss-prod/global/networks/paradigm-vpc-prod"
    routes = [
      {
        name              = "gcp-cr-route1"
        destination_range = "0.0.0.0/0"
        next_hop_internet = "true"
        priority          = "100"
      }
    ]
  }
}

sa_role = ""