environment = "sandbox"

google_compute_subnetwork_iam_members = {
  "fleet-host-b" = {
    project_number = "1043568935529"
  }
  "fleet-member" = {
    project_number = "125396375999"
  }
}

region        = "us-east1"
remote_bucket = "plt-lz-testing-2c8b-sb"

subnets = {
  "fleet-host-b" = {
    "ip_cidr_range" = "10.60.0.0/20"

    secondary_ip_ranges = [
      {
        range_name    = "fleet-host-k8s-services-us-east1-b"
        ip_cidr_range = "10.60.240.0/20"
      },
      {
        range_name    = "fleet-host-k8s-pods-us-east1-b"
        ip_cidr_range = "10.0.0.0/14"
      }
    ]
  }

  "fleet-member" = {
    ip_cidr_range = "10.60.16.0/20"
    secondary_ip_ranges = [
      {
        range_name    = "fleet-member-k8s-services-us-east1"
        ip_cidr_range = "10.61.0.0/20"
      },
      {
        range_name    = "fleet-member-k8s-pods-us-east1"
        ip_cidr_range = "10.4.0.0/14"
      }
    ]
  }
}
