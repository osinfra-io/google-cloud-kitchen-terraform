locals {
  vpc_service_projects = {
    "gke_fleet_host_project" : {
      id : module.gke_fleet_host_project.project_id,
      number : module.gke_fleet_host_project.project_number
    },
    "gke_fleet_service_project" : {
      id : module.gke_fleet_service_project.project_id,
      number : module.gke_fleet_service_project.project_number
    }
  }
}
