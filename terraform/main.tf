provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "data_bucket" {
  bucket        = "pizza-delivery-dataline-project-25"
  force_destroy = true
}

resource "aws_s3_bucket" "query_results" {
  bucket        = "pizza-delivery-athena-results-25"
  force_destroy = true
}

resource "aws_glue_catalog_database" "pizza_db" {
  name = "pizza_db"
}

resource "aws_glue_catalog_table" "pizza_table" {
  name          = "pizza_data"
  database_name = aws_glue_catalog_database.pizza_db.name
  table_type    = "EXTERNAL_TABLE"

  storage_descriptor {
    location      = "s3://${aws_s3_bucket.data_bucket.bucket}/raw/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      name                  = "OpenCSVSerde"
      serialization_library = "org.apache.hadoop.hive.serde2.OpenCSVSerde"
    }

    columns {
      name = "date"
      type = "string"
    }

    columns {
      name = "delivery_zone"
      type = "string"
    }

    columns {
      name = "home_type"
      type = "string"
    }

    columns {
      name = "price"
      type = "double"
    }

    columns {
      name = "tip"
      type = "double"
    }

    columns {
      name = "cash_tip"
      type = "double"
    }

    columns {
      name = "distance_miles"
      type = "double"
    }

    columns {
      name = "total_earnings"
      type = "double"
    }

    columns {
      name = "tip_percentage"
      type = "double"
    }

    columns {
      name = "earnings_per_mile"
      type = "double"
    }
  }

  parameters = {
    "classification"          = "csv"
    "skip.header.line.count"  = "1"
  }
}

resource "aws_athena_workgroup" "pizza_workgroup" {
  name = "pizza_workgroup"

  configuration {
    result_configuration {
      output_location = "s3://${aws_s3_bucket.query_results.bucket}/athena-results/"
    }
  }
}
