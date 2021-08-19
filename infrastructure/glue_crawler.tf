resource "aws_glue_crawler" "stream" {
  database_name = "datalakeathena"
  name          = "firehose_stream_s3_crawler"
  role          = "AWSGlueServiceRole-testegti"

  s3_target {
    path = "s3://${aws_s3_bucket.stream.bucket}/silver-data/"
  }

  configuration = <<EOF
{
   "Version": 1.0,
   "Grouping": {
      "TableGroupingPolicy": "CombineCompatibleSchemas" }
}
EOF

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}