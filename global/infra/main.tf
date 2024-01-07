terraform {

  # Requiring Providers
  # https://www.terraform.io/language/providers/requirements#requiring-providers

  required_providers {

    # Datadog Provider
    # https://registry.terraform.io/providers/DataDog/datadog/latest/docs

    datadog = {
      source = "datadog/datadog"
    }

    # Google Cloud Platform Provider
    # https://registry.terraform.io/providers/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }

    # Random Provider
    # https://registry.terraform.io/providers/hashicorp/random/latest/docs

    random = {
      source = "hashicorp/random"
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

# Datadog Google Cloud Platform Integration Module (osinfra.io)
# https://github.com/osinfra-io/terraform-datadog-google-integration

# module "datadog" {
#   source = "github.com/osinfra-io/terraform-datadog-google-integration//global?ref=v0.1.0"

#   api_key         = var.datadog_api_key
#   is_cspm_enabled = true
#   project         = module.project.project_id
# }

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "host_project" {
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.8"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  description                     = "kitchen"
  environment                     = var.environment
  folder_id                       = var.folder_id

  labels = {
    "environment" = var.environment,
    "description" = "kitchen",
    "platform"    = "google-cloud-landing-zone",
  }

  prefix = "testing"

  services = [
    "billingbudgets.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com"
  ]
}

module "service_project" {
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.8"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  description                     = "kitchen"
  environment                     = var.environment
  folder_id                       = var.folder_id

  labels = {
    "environment" = var.environment,
    "description" = "kitchen",
    "platform"    = "google-cloud-landing-zone",
  }

  prefix = "testing"

  services = [
    "billingbudgets.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "dns.googleapis.com",
    "gkehub.googleapis.com",
    "iam.googleapis.com",
    "monitoring.googleapis.com",
    "multiclusteringress.googleapis.com",
    "multiclusterservicediscovery.googleapis.com",
    "pubsub.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
    "trafficdirector.googleapis.com"
  ]
}

# Google VPC Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-vpc

module "vpc" {
  source = "github.com/osinfra-io/terraform-google-vpc//global?ref=v0.1.1"

  name       = "kitchen-vpc"
  project    = module.host_project.project_id
  shared_vpc = true
}

# Compute Global Address Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address

resource "google_compute_global_address" "service_network_peering_range" {
  address       = "172.16.0.0"
  address_type  = "INTERNAL"
  name          = "service-network-peering-range"
  network       = module.vpc.self_link
  prefix_length = 16
  project       = module.host_project.project_id
  purpose       = "VPC_PEERING"
}

# Compute Shared VPC Service Project Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project

resource "google_compute_shared_vpc_service_project" "this" {
  host_project    = module.host_project.project_id
  service_project = module.service_project.project_id
}

resource "google_project_iam_member" "this" {
  for_each = toset([
    "organizations/163313809793/roles/kubernetes.hostFirewallManagement",
    "roles/container.hostServiceAgentUser"
  ])
  member  = "serviceAccount:service-${module.service_project.project_number}@container-engine-robot.iam.gserviceaccount.com"
  project = module.host_project.project_id
  role    = each.key
}

# Service Networking Connection Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection

resource "google_service_networking_connection" "this" {
  network                 = module.vpc.self_link
  reserved_peering_ranges = [google_compute_global_address.service_network_peering_range.name]
  service                 = "servicenetworking.googleapis.com"
}
