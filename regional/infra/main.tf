# Required Providers
# https://www.terraform.io/docs/language/providers/requirements.html#requiring-providers

terraform {
  required_providers {

    # Google Cloud Provider
    # https://www.terraform.io/docs/providers/google/index.html

    google = {
      source = "hashicorp/google"
    }

  }
}

# Terraform Remote State Datasource
# https://www.terraform.io/docs/language/state/remote-state-data.html

data "terraform_remote_state" "global" {
  backend = "gcs"

  config = {
    bucket = var.remote_bucket
    prefix = "google-cloud-kitchen-terraform"
  }

  workspace = "global-${var.environment}"
}

# Google Subnet Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-subnet

module "subnet" {
  source = "github.com/osinfra-io/terraform-google-subnet//regional?ref=v0.1.0"

  ip_cidr_range            = var.ip_cidr_range
  name                     = "kitchen-subnet-${var.region}"
  network                  = "kitchen-vpc"
  private_ip_google_access = true
  project                  = local.global.vpc_host_project_id
  region                   = var.region
  secondary_ip_ranges      = var.secondary_ip_ranges
}

# Compute Subnetwork IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam

resource "google_compute_subnetwork_iam_member" "this" {
  for_each = toset(
    [
      "serviceAccount:${local.global.service_project_number}@cloudservices.gserviceaccount.com",
      "serviceAccount:service-${local.global.service_project_number}@container-engine-robot.iam.gserviceaccount.com"
    ]
  )

  member     = each.key
  project    = local.global.vpc_host_project_id
  region     = var.region
  role       = "roles/compute.networkUser"
  subnetwork = "kitchen-subnet-${var.region}"
}
