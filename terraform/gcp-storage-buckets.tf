########################################
# telemetry_events_tmp
########################################

resource "google_storage_bucket" "telemetry_events_tmp" {
  name     = "telemetry_events_tmp"
  location = var.gcp_region
}
