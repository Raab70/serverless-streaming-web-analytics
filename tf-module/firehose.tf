resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}"
  acl    = "private"
}

resource "aws_kinesis_firehose_delivery_stream" "delivery_stream" {
  name        = "SSWA-firehose-${var.stream_name}"
  destination = "s3"

  kinesis_source_configuration {
    kinesis_stream_arn = "${aws_kinesis_stream.stream.arn}"
    role_arn           = "${aws_iam_role.firehose_role.arn}"
  }

  s3_configuration {
    role_arn   = "${aws_iam_role.firehose_role.arn}"
    bucket_arn = "${aws_s3_bucket.bucket.arn}"
  }
}