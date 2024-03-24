# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  labels = {
    env         = var.environment,
    cost-center = "x001"
    platform    = "google-cloud-landing-zone",
    repository  = "google-cloud-kitchen-terraform",
    team        = "platform-google-cloud-landing-zone"
  }

  global = data.terraform_remote_state.global.outputs
}
