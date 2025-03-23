output "s3_bucket" {
  value = aws_s3_bucket.data_bucket.bucket
}

output "query_results_bucket" {
  value = aws_s3_bucket.query_results.bucket
}

output "glue_db" {
  value = aws_glue_catalog_database.pizza_db.name
}
