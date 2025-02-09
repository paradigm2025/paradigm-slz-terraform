vpns = {
        vpn1 = {
                 project_id               = "prj-paradigm-ss-nonprod"
                 network                  = "projects/prj-paradigm-ss-nonprod/global/networks/paradigm-vpc-nonprod"
                 region                   = "us-central1"
                 description              = "Route for US-Central1 of paradigm-vpc-nonprod network"
                 gateway_name             = "paradigm-uscentral1-vpn-gw1" 
                 tunnel_name_prefix       = "paradigm-uscentral1-vpn-gw1-tunnel"
                 shared_secret            = "" 
                 tunnel_count             = 1
                 peer_ips                 = [""] 
                 route_priority           = 100
                 remote_subnet            = [""]
         }
        
}