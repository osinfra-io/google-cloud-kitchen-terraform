# Output Values
# https://www.terraform.io/language/values/outputs

output "project_id" {
  description = "The project ID"
  value       = module.project.project_id
}
