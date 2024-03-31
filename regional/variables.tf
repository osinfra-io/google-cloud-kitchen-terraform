variable "environment" {
  description = "The environment suffix for example: `sb` (Sandbox), `nonprod` (Non-Production), `prod` (Production)"
  type        = string
  default     = "sb"
}

variable "google_compute_subnetwork_iam_members" {
  description = "A map of IAM members to add to the subnetwork"
  type = map(object({
    project_number = string
  }))
  default = {}
}

variable "region" {
  description = "The region for this subnetwork"
  type        = string
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}

variable "subnets" {
  description = "The map of subnets to create"
  type = map(object({
    ip_cidr_range          = string
    service_project_number = string
    master_ip_cidr_range   = string
    pod_ip_cidr_range      = string
    services_ip_cidr_range = string
  }))
  default = {}
}
