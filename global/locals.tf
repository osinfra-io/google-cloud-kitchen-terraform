locals {
  datadog_projects = {
    "gke_fleet_host_project" : {
      id : module.gke_fleet_host_project.project_id
    },
    "gke_fleet_member_project" : {
      id : module.gke_fleet_member_project.project_id
    }
  }

  labels = {
    cost-center = "x001"
    env         = var.environment,
    platform    = "google-cloud-landing-zone",
    repository  = "google-cloud-kitchen-terraform",
    team        = "platform-google-cloud-landing-zone"
  }

  vpc_service_projects = {
    "gke_fleet_host_project" : {
      id : module.gke_fleet_host_project.project_id,
      number : module.gke_fleet_host_project.project_number
    },
    "gke_fleet_member_project" : {
      id : module.gke_fleet_member_project.project_id,
      number : module.gke_fleet_member_project.project_number
    }
  }
}
