environment = "sandbox"

google_compute_subnetwork_iam_members = {
  "fleet-host" = {
    project_number = "1043568935529"
  }
}

region        = "us-east1"
remote_bucket = "plt-lz-testing-2c8b-sb"

subnets = {
  "fleet-host" = {
    "ip_cidr_range" = "10.60.0.0/20"

    secondary_ip_ranges = [
      {
        range_name    = "fleet-host-k8s-services-us-east1"
        ip_cidr_range = "10.60.240.0/20"
      },
      {
        range_name    = "fleet-host-k8s-pods-us-east1"
        ip_cidr_range = "10.0.0.0/14"
      }
    ]
  }
}
