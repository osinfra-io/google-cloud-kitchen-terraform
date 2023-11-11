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
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.6"

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
    "serviceusage.googleapis.com"
  ]
}

module "service_project" {
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.6"

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
    "container.googleapis.com",
    "compute.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
    "serviceusage.googleapis.com"
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

# Compute Shared VPC Service Project Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project

resource "google_compute_shared_vpc_service_project" "this" {
  host_project    = module.service_project.project_id
  service_project = module.host_project.project_id
}
