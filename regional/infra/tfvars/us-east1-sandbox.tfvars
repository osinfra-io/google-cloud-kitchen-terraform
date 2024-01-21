environment   = "sandbox"
ip_cidr_range = "10.60.0.0/20"
region        = "us-east1"
remote_bucket = "plt-lz-testing-2c8b-sb"

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
