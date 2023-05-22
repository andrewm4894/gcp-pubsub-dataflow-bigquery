########################################
# telemetry_events_to_bq_v1
########################################

resource "google_dataflow_job" "telemetry_events_to_bq_v1" {
  name              = "telemetry_events_to_bq_v1"
  template_gcs_path = "gs://dataflow-templates/latest/PubSub_to_BigQuery"
  temp_gcs_location = google_storage_bucket.telemetry_events_tmp.url
  parameters = {
    inputTopic = google_pubsub_topic.telemetry_events.id,
    outputTableSpec = "${var.gcp_project_name}:${google_bigquery_dataset.telemetry_events.dataset_id}.${google_bigquery_table.telemetry_events_raw_events.table_id}"
  }
  on_delete = "cancel"
  zone = var.gcp_zone
}