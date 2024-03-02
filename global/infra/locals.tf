locals {
  labels = {
    env         = var.environment,
    cost-center = "x001"
    platform    = "google-cloud-landing-zone",
    repository  = "google-cloud-kitchen-terraform",
    team        = "platform-google-cloud-landing-zone"
  }

  projects = {
    "gke_fleet_host_project" : {
      id : module.gke_fleet_host_project.project_id
    },
    "gke_fleet_member_project" : {
      id : module.gke_fleet_member_project.project_id
    }
    "vpc_host_project" : {
      id : module.vpc_host_project.project_id
    }
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
