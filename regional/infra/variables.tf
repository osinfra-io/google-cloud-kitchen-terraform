variable "environment" {
  description = "The environment suffix for example: `sb` (Sandbox), `nonprod` (Non-Production), `prod` (Production)"
  type        = string
  default     = "sb"
}

variable "ip_cidr_range" {
  description = "The range of internal addresses that are owned by this subnetwork"
  type        = string
}

variable "region" {
  description = "The region for this subnetwork"
  type        = string
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}

variable "secondary_ip_ranges" {
  description = "An array of configurations for secondary IP ranges for VM instances contained in this subnetwork"
  type = list(object({
    ip_cidr_range = string
    range_name    = string
  }))
}
