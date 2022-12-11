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

# Bridgecrew Read-Only Module
# https://registry.terraform.io/modules/bridgecrewio/bridgecrew-gcp-read-only

module "bridgecrew-read" {
  source = "bridgecrewio/bridgecrew-gcp-read-only/google"

  bridgecrew_token = var.bridgecrew_api_key
  org_name         = "osinfra"
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "project" {
  source = "github.com/osinfra-io/terraform-google-project"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  env                             = var.env
  folder_id                       = var.folder_id

  labels = {
    "environment" = var.env,
    "system"      = "kitchen",
    "team"        = "shared"
  }

  prefix = "shared"
  system = "kitchen"
}
