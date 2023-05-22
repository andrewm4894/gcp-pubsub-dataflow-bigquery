########################################
# telemetry_events
########################################

resource "google_pubsub_topic" "telemetry_events" {
  name = "telemetry_events"
}
