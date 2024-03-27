environment = "sandbox"

google_compute_subnetwork_iam_members = {
  "fleet-host-b" = {
    project_number = "1043568935529"
  }
}

region        = "us-east1"
remote_bucket = "plt-lz-testing-2c8b-sb"

subnets = {
  "fleet-host-b" = {
    "ip_cidr_range" = "10.60.0.0/20"

    secondary_ip_ranges = [
      {
        range_name    = "fleet-host-b-k8s-services-us-east1"
        ip_cidr_range = "10.60.240.0/20"
      },
      {
        range_name    = "fleet-host-b-k8s-pods-us-east1"
        ip_cidr_range = "10.0.0.0/14"
      }
    ]
  }

  "fleet-member-c" = {
    ip_cidr_range = "10.60.16.0/20"
    secondary_ip_ranges = [
      {
        range_name    = "fleet-member-c-k8s-services-us-east1"
        ip_cidr_range = "10.61.0.0/20"
      },
      {
        range_name    = "fleet-member-c-k8s-pods-us-east1"
        ip_cidr_range = "10.4.0.0/14"
      }
    ]
  }

  "fleet-host-d" = {
    ip_cidr_range = "10.60.32.0/20"
    secondary_ip_ranges = [
      {
        range_name    = "fleet-member-d-k8s-services-us-east1"
        ip_cidr_range = "10.61.16.0/20"
      },
      {
        range_name    = "fleet-member-d-k8s-pods-us-east1"
        ip_cidr_range = "10.8.0.0/14"
      }
    ]
  }
}
