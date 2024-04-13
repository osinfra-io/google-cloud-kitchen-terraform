terraform {
  backend "gcs" {
    prefix = "google-cloud-terraform-testing"
  }
}
