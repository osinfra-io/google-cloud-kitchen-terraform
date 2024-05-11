environment   = "sandbox"
region        = "us-east1"
remote_bucket = "plt-lz-testing-2c8b-sb"

subnets = {
  "fleet-host-us-east1-b" = {
    ip_cidr_range          = "10.62.0.0/21"
    master_ip_cidr_range   = "10.63.240.48/28"
    pod_ip_cidr_range      = "10.0.0.0/15"
    services_ip_cidr_range = "10.62.248.0/21"
    service_project_number = "1043568935529"
  }

  "fleet-member-us-east1" = {
    ip_cidr_range          = "10.62.8.0/21"
    master_ip_cidr_range   = "10.63.240.16/28"
    pod_ip_cidr_range      = "10.2.0.0/15"
    services_ip_cidr_range = "10.63.0.0/21"
    service_project_number = "125396375999"
  }
}
