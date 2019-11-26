resource "google_storage_bucket" "automation" {
  name          = "${var.project}-${var.env_name}-automation"
  location      = var.buckets_location
  force_destroy = true
  count         = var.create_gcs_buckets ? 1 : 0
}

resource "google_storage_bucket" "installations" {
  name          = "${var.project}-${var.env_name}-installations"
  location      = var.buckets_location
  force_destroy = true
  count         = var.create_gcs_buckets ? 1 : 0
}

output "automation_bucket" {
  value = element(concat(google_storage_bucket.automation.*.name, [""]), 0)
}

output "installations_bucket" {
  value = element(concat(google_storage_bucket.installations.*.name, [""]), 0)
}