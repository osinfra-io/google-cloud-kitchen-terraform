environment   = "sandbox"
ip_cidr_range = "10.60.48.0/20"
region        = "us-east4"
remote_bucket = "plt-lz-testing-2c8b-sb"

secondary_ip_ranges = [
  {
    range_name    = "kitchen-k8s-services-us-east4"
    ip_cidr_range = "10.61.0.0/20"
  },
  {
    range_name    = "kitchen-k8s-pods-us-east4"
    ip_cidr_range = "10.4.0.0/14"
  }
]
