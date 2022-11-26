terraform {
  backend "gcs" {
    prefix = "google-cloud-kitchen-terraform"
  }
}
