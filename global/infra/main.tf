terraform {

  # Requiring Providers
  # https://www.terraform.io/language/providers/requirements#requiring-providers

  required_providers {

    # Google Cloud Platform Provider
    # https://registry.terraform.io/providers/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "project" {
  source = "github.com/osinfra-io/terraform-google-project?ref=v0.1.1"

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
    "dns.googleapis.com",
    "pubsub.googleapis.com"
  ]
}

# Google VPC Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-vpc

module "vpc" {
  source = "github.com/osinfra-io/terraform-google-vpc//global?ref=v0.1.0"

  name    = "kitchen-vpc"
  project = module.project.project_id
}
