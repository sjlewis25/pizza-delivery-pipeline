variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "data_bucket_name" {
  description = "S3 bucket name for raw pizza delivery data"
  type        = string
  default     = "pizza-delivery-dataline-project-25"
}

variable "query_results_bucket_name" {
  description = "S3 bucket for Athena query results"
  type        = string
  default     = "pizza-delivery-athena-results-25"
}

variable "glue_db_name" {
  description = "Glue catalog database name"
  type        = string
  default     = "pizza_db"
}

variable "athena_workgroup_name" {
  description = "Athena workgroup name"
  type        = string
  default     = "pizza_workgroup"
}
