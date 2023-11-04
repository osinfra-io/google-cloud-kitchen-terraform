# Refactoring
# https://developer.hashicorp.com/terraform/language/modules/develop/refactoring

# We did not initially have this root module setup to support a shared VPC and testing
# of resources that would use it so there was no need for a host project and service
# project.

moved {
  from = module.project
  to   = module.service_project
}
