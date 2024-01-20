# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  vpc_service_projects = {
    (module.gke_fleet_host_project.project_id) = {
      number = module.gke_fleet_host_project.project_number
    },
    (module.gke_fleet_service_project.project_id) = {
      number = module.gke_fleet_service_project.project_number
    }
  }
}
