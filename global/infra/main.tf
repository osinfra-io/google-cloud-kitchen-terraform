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

#   for_each = local.projects

#   api_key         = var.datadog_api_key
#   is_cspm_enabled = true
#   project         = each.value.id
# }

# Google Cloud DNS Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-cloud-dns

module "dns" {
  source = "github.com/osinfra-io/terraform-google-cloud-dns//global?ref=v0.1.0"

  dns_name = "test.gcp.osinfra.io."

  labels = {
    env         = var.environment
    cost-center = "x001"
    repository  = "google-cloud-kitchen-terraform"
    platform    = "google-cloud-landing-zone"
    team        = "platform-google-cloud-landing-zone"
  }

  name       = "test-gcp-osinfra-io"
  project    = module.vpc_host_project.project_id
  visibility = "public"
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "vpc_host_project" {
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.9"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  description                     = "vpc-host"
  environment                     = var.environment
  folder_id                       = var.folder_id

  labels = {
    env         = var.environment,
    description = "vpc-host",
    platform    = "google-cloud-landing-zone",
    repository  = "google-cloud-kitchen-terraform",
    team        = "platform-google-cloud-landing-zone"
  }

  prefix = "test"

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

module "gke_fleet_host_project" {
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.9"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  description                     = "gke-fleet-host"
  environment                     = var.environment
  folder_id                       = var.folder_id

  labels = {
    env         = var.environment,
    description = "gke-fleet-host",
    platform    = "google-cloud-landing-zone",
    repository  = "google-cloud-kitchen-terraform",
    team        = "platform-google-cloud-landing-zone"
  }

  prefix = "test"

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

module "gke_fleet_member_project" {
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.9"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  description                     = "gke-fleet-member"
  environment                     = var.environment
  folder_id                       = var.folder_id

  labels = {
    env         = var.environment,
    description = "gke-fleet-member",
    platform    = "google-cloud-landing-zone",
    repository  = "google-cloud-kitchen-terraform",
    team        = "platform-google-cloud-landing-zone"
  }

  prefix = "test"

  services = [
    "billingbudgets.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "monitoring.googleapis.com",
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
  project    = module.vpc_host_project.project_id
  shared_vpc = true
}

# Google Artifact Registry Repository
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository

resource "google_artifact_registry_repository" "docker_standard" {
  description = "Registry for multi-region - US Standard : test"
  format      = "DOCKER"

  labels = {
    env         = var.environment,
    cost_center = "x001"
    platform    = "google-cloud-landing-zone",
    repository  = "google-cloud-kitchen-terraform",
    team        = "platform-google-cloud-landing-zone"
  }

  location      = "us"
  project       = module.vpc_host_project.project_id
  repository_id = "test-standard"
}

resource "google_artifact_registry_repository" "docker_remote" {
  description = "Registry for multi-region - US Docker Hub"
  format      = "DOCKER"

  labels = {
    env         = var.environment,
    cost_center = "x001"
    platform    = "google-cloud-landing-zone",
    repository  = "google-cloud-kitchen-terraform",
    team        = "platform-google-cloud-landing-zone"
  }

  location = "us"
  mode     = "REMOTE_REPOSITORY"
  project  = module.vpc_host_project.project_id

  remote_repository_config {
    description = "docker hub"
    docker_repository {
      public_repository = "DOCKER_HUB"
    }
  }

  repository_id = "docker-remote"
}

resource "google_artifact_registry_repository" "docker_virtual" {
  description = "Registry for multi-region - US Virtual : test"
  format      = "DOCKER"
  location    = "us"

  labels = {
    env         = var.environment,
    cost_center = "x001"
    platform    = "google-cloud-landing-zone",
    repository  = "google-cloud-kitchen-terraform",
    team        = "platform-google-cloud-landing-zone"
  }

  mode          = "VIRTUAL_REPOSITORY"
  project       = module.vpc_host_project.project_id
  repository_id = "test-virtual"

  virtual_repository_config {
    upstream_policies {
      id         = "test"
      priority   = 20
      repository = google_artifact_registry_repository.docker_standard.id
    }

    upstream_policies {
      id         = "docker"
      priority   = 10
      repository = google_artifact_registry_repository.docker_remote.id
    }
  }
}

# Google Artifact Registry IAM Binding
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository_iam

resource "google_artifact_registry_repository_iam_binding" "docker_virtual_readers" {
  location   = "us"
  project    = module.vpc_host_project.project_id
  repository = google_artifact_registry_repository.docker_virtual.id
  role       = "roles/artifactregistry.reader"
  members    = ["serviceAccount:plt-lz-testing-github@ptl-lz-terraform-tf91-sb.iam.gserviceaccount.com"]
}

resource "google_artifact_registry_repository_iam_binding" "docker_standard_writers" {
  location   = "us"
  project    = module.vpc_host_project.project_id
  repository = google_artifact_registry_repository.docker_standard.id
  role       = "roles/artifactregistry.writer"
  members    = ["serviceAccount:plt-lz-testing-github@ptl-lz-terraform-tf91-sb.iam.gserviceaccount.com"]
}

# Compute Global Address Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address

resource "google_compute_global_address" "service_network_peering_range" {
  address       = "172.16.0.0"
  address_type  = "INTERNAL"
  name          = "service-network-peering-range"
  network       = module.vpc.self_link
  prefix_length = 16
  project       = module.vpc_host_project.project_id
  purpose       = "VPC_PEERING"
}

# Compute Shared VPC Service Project Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project

resource "google_compute_shared_vpc_service_project" "this" {
  for_each = local.vpc_service_projects

  host_project    = module.vpc.project
  service_project = each.value.id
}

# Project IAM Member Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_member

resource "google_project_iam_member" "container_engine_firewall_management" {
  for_each = local.vpc_service_projects

  member  = "serviceAccount:service-${each.value.number}@container-engine-robot.iam.gserviceaccount.com"
  project = module.vpc_host_project.project_id
  role    = "organizations/163313809793/roles/kubernetes.hostFirewallManagement"
}

resource "google_project_iam_member" "container_engine_service_agent_user" {
  for_each = local.vpc_service_projects

  member  = "serviceAccount:service-${each.value.number}@container-engine-robot.iam.gserviceaccount.com"
  project = module.vpc_host_project.project_id
  role    = "roles/container.hostServiceAgentUser"
}

# Service Networking Connection Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection

resource "google_service_networking_connection" "this" {
  network                 = module.vpc.self_link
  reserved_peering_ranges = [google_compute_global_address.service_network_peering_range.name]
  service                 = "servicenetworking.googleapis.com"
}
