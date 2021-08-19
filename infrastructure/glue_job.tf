resource "aws_glue_job" "example" {
  name     = "desafio1-igti"
  role_arn = "glue_full_access"

  command {
    script_location = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}/glue-code/pyspark/job_spark_from_tf.py"
  }
}