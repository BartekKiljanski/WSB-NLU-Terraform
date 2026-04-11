locals {
  name_prefix = "wsb-${var.student_name}-${var.environment}"

  all_tags = merge(
    {
      ManagedBy   = "Terraform"
      Environment = var.environment
      Student     = var.student_name
      Project     = "wsb-cw2"
    },
    var.tags
  )
}

resource "aws_s3_bucket" "main" {
  bucket = "${local.name_prefix}-bucket"
  tags   = local.all_tags
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.main.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}