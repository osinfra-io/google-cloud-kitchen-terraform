# Output Values
# https://www.terraform.io/language/values/outputs

output "gke_fleet_host_project_id" {
  description = "The ID of the GKE Fleet Host Project"
  value       = module.gke_fleet_host_project.project_id
}

output "gke_fleet_service_project_id" {
  description = "The ID of the GKE Fleet Service Project"
  value       = module.gke_fleet_service_project.project_id
}

output "vpc_host_project_id" {
  description = "The ID of the VPC Host Project"
  value       = module.vpc_host_project.project_id
}
