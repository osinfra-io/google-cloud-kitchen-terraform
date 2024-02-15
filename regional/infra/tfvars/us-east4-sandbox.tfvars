environment = "sandbox"

google_compute_subnetwork_iam_members = {
  "fleet-member" = {
    project_number = "865524194849"
  }
}

region        = "us-east4"
remote_bucket = "plt-lz-testing-2c8b-sb"

subnets = {
  "fleet-member" = {
    ip_cidr_range = "10.60.16.0/20"
    secondary_ip_ranges = [
      {
        range_name    = "fleet-member-k8s-services-us-east4"
        ip_cidr_range = "10.61.0.0/20"
      },
      {
        range_name    = "fleet-member-k8s-pods-us-east4"
        ip_cidr_range = "10.4.0.0/14"
      }
    ]
  }
}
