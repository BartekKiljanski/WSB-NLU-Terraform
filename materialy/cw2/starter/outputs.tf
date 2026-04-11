output "bucket_name" {
  description = "Nazwa bucketu"
  value       = aws_s3_bucket.main.id
}

output "bucket_arn" {
  description = "ARN bucketu"
  value       = aws_s3_bucket.main.arn
}

output "versioning_status" {
  description = "Status wersjonowania"
  value       = aws_s3_bucket_versioning.main.versioning_configuration[0].status
}

output "all_tags" {
  description = "Wszystkie tagi zastosowane na buckecie"
  value       = local.all_tags
}
