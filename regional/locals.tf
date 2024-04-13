# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  labels = {
    cost-center = "x001"
    env         = var.environment,
    platform    = "google-cloud-landing-zone",
    repository  = "google-cloud-terraform-testing",
    team        = "platform-google-cloud-landing-zone"
  }

  global = data.terraform_remote_state.global.outputs
}
