output "bucket_name" {
  description = "Bucket name"
  value       = aws_s3_bucket.this.id
}

output "versioning_status" {
  description = "Bucket versioning status"
  value       = aws_s3_bucket_versioning.this.versioning_configuration[0].status
}

output "all_tags" {
  description = "All tags applied to the bucket"
  value       = local.all_tags
}
