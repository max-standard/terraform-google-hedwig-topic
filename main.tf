resource "google_pubsub_topic" "topic" {
  name = "hedwig-${var.topic}"
}

data "google_client_config" "current" {}

resource "google_dataflow_job" "firehose" {
  name              = "${google_pubsub_topic.topic.name}-firehose"
  temp_gcs_location = "${var.dataflow_tmp_gcs_location}"
  template_gcs_path = "${var.dataflow_template_gcs_path}"

  zone = "${var.dataflow_zone}"

  parameters = {
    inputTopic           = "projects/${data.google_client_config.current.project}/topics/${google_pubsub_topic.topic.name}"
    outputDirectory      = "${var.dataflow_output_directory}"
    outputFilenamePrefix = "${var.dataflow_output_filename_prefix == "" ? format("%s-", google_pubsub_topic.topic.name) : var.dataflow_output_filename_prefix}"
  }
}
