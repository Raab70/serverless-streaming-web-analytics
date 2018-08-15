resource "aws_kinesis_stream" "stream" {
  name             = "SSWA-${var.stream_name}"
  shard_count      = 1
  retention_period = 24

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  tags {
    Module    = "SSWA"
    Terraform = "True"
  }
}