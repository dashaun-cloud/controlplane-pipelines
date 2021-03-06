provider "google" {
  project     = var.project
  credentials = var.service_account_key

  version = "~> 2.5"
}

terraform {
  required_version = ">= 0.12.0"
}

resource "google_storage_bucket" "platform-automation-bucket" {
  name     = "${var.project}-${var.env_name}"
  force_destroy = "true"
  storage_class = "MULTI_REGIONAL"
}