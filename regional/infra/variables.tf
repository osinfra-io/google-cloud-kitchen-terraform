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
  description = "A map of subnets to create"
  type = map(object({
    ip_cidr_range = string
    secondary_ip_ranges = list(object({
      ip_cidr_range = string
      range_name    = string
    }))
  }))
}
