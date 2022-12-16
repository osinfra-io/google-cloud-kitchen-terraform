# Input Variables
# https://www.terraform.io/language/values/variables

variable "billing_account" {
  description = "The alphanumeric ID of the billing account this project belongs to"
  type        = string
  sensitive   = true
}

variable "cis_2_2_logging_sink_project_id" {
  description = "The CIS 2.2 logging sink benchmark project ID"
  type        = string
}

variable "env" {
  description = "This is the environment suffix for example: sb (Sandbox), nonprod (Non-Production), prod (Production)"
  type        = string
}

variable "folder_id" {
  description = "Folder ID for the project to be created in"
  type        = string
}

variable "random_project_id" {
  description = "This will add a random value in the project ID if set to true"
  type        = bool
  default     = false
}
