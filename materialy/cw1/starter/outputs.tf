output "bucket_name" {
  description = "Nazwa stworzonego bucketu S3"
  value       = aws_s3_bucket.main.id
}

output "bucket_arn" {
  description = "ARN bucketu (unikalny identyfikator w AWS)"
  value       = aws_s3_bucket.main.arn
}

output "region" {
  description = "Region w którym stworzono bucket"
  value       = var.aws_region
}
