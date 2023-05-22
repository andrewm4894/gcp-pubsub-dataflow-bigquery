####################
## telemetry_events.raw_events
####################

resource "google_bigquery_table" "telemetry_events_raw_events" {
  dataset_id = google_bigquery_dataset.telemetry_events.dataset_id
  table_id   = "raw_events"

  time_partitioning {
    type                     = "DAY"
    require_partition_filter = true
  }

  schema = <<EOF
[
  {
    "name": "k1",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "k2",
    "type": "STRING",
    "mode": "NULLABLE"
  }
]
EOF

}
