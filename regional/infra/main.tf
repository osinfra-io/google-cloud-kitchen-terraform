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
  source   = "github.com/osinfra-io/terraform-google-subnet//regional?ref=v0.1.1"
  for_each = var.subnets

  ip_cidr_range            = each.value.ip_cidr_range
  name                     = "${each.key}-${var.region}"
  network                  = "kitchen-vpc"
  private_ip_google_access = true
  project                  = local.global.vpc_host_project_id
  region                   = var.region
  secondary_ip_ranges      = each.value.secondary_ip_ranges
}
# Google Artifact Registry Repository
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository

resource "google_artifact_registry_repository" "docker_standard" {
  count = var.region == "us-east1" ? 1 : 0

  description   = "Registry for multi-region - US Standard : test"
  format        = "DOCKER"
  labels        = local.labels
  location      = "us"
  project       = local.global.vpc_host_project_id
  repository_id = "test-standard"
}

resource "google_artifact_registry_repository" "docker_remote" {
  count = var.region == "us-east1" ? 1 : 0

  description = "Registry for multi-region - US Docker Hub"
  format      = "DOCKER"
  labels      = local.labels
  location    = "us"
  mode        = "REMOTE_REPOSITORY"
  project     = local.global.vpc_host_project_id

  remote_repository_config {
    description = "docker hub"
    docker_repository {
      public_repository = "DOCKER_HUB"
    }
  }

  repository_id = "docker-remote"
}

resource "google_artifact_registry_repository" "docker_virtual" {
  count = var.region == "us-east1" ? 1 : 0

  description   = "Registry for multi-region - US Virtual : test"
  format        = "DOCKER"
  location      = "us"
  labels        = local.labels
  mode          = "VIRTUAL_REPOSITORY"
  project       = local.global.vpc_host_project_id
  repository_id = "test-virtual"

  virtual_repository_config {
    upstream_policies {
      id         = "test"
      priority   = 20
      repository = google_artifact_registry_repository.docker_standard[0].id
    }

    upstream_policies {
      id         = "docker"
      priority   = 10
      repository = google_artifact_registry_repository.docker_remote[0].id
    }
  }
}

# Compute Subnetwork IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam

resource "google_compute_subnetwork_iam_member" "cloudservices" {
  for_each = var.google_compute_subnetwork_iam_members

  member     = "serviceAccount:${each.value.project_number}@cloudservices.gserviceaccount.com"
  project    = local.global.vpc_host_project_id
  region     = var.region
  role       = "roles/compute.networkUser"
  subnetwork = module.subnet[each.key].name
}

resource "google_compute_subnetwork_iam_member" "container_engine" {
  for_each = var.google_compute_subnetwork_iam_members

  member     = "serviceAccount:service-${each.value.project_number}@container-engine-robot.iam.gserviceaccount.com"
  project    = local.global.vpc_host_project_id
  region     = var.region
  role       = "roles/compute.networkUser"
  subnetwork = module.subnet[each.key].name
}
