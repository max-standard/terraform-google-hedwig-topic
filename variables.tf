variable "topic" {
  description = "Name of the Hedwig topic (should contain alphanumeric and dashes only by convention); unique across your infra"
}

variable "enable_firehose_all_messages" {
  description = "Should all messages published to this topic be firehosed into Cloud Storage"
  default     = "false"
}

variable "dataflow_tmp_gcs_location" {
  description = "A gs bucket location for storing temporary files by Google Dataflow, e.g. gs://myBucket/tmp"
}

variable "dataflow_template_gcs_path" {
  description = "The template path for Google Dataflow, e.g. gs://dataflow-templates/2019-04-24-00/Cloud_PubSub_to_GCS_Text"
}

variable "dataflow_zone" {
  description = "The zone to use for Dataflow. This may be required if it's not set at the provider level, or that zone doesn't support Dataflow"
  default     = ""
}

variable "dataflow_output_directory" {
  description = "A gs bucket location for storing output files by Google Dataflow, e.g. gs://myBucket/hedwigBackup"
}

variable "dataflow_output_filename_prefix" {
  description = "Filename prefix for output files by Google Dataflow (defaults to subscription name)"
  default     = ""
}