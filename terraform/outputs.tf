output "data_bucket_name" {
  description = "Name of the S3 bucket storing raw pizza delivery data"
  value       = aws_s3_bucket.data_bucket.bucket
}

output "query_results_bucket_name" {
  description = "Name of the S3 bucket where Athena query results are stored"
  value       = aws_s3_bucket.query_results.bucket
}

output "glue_database_name" {
  description = "Name of the AWS Glue database used for cataloging pizza data"
  value       = aws_glue_catalog_database.pizza_db.name
}

output "athena_output_location" {
  description = "S3 path where Athena query results are written"
  value       = "s3://${aws_s3_bucket.query_results.bucket}/athena-results/"
}
