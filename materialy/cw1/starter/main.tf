locals {
  # Wspólny prefix dla wszystkich zasobów – używaj go w nazwach
  name_prefix = "wsb-${var.student_name}-${var.environment}"

  # Obowiązkowe tagi na wszystkich zasobach
  common_tags = {
    ManagedBy   = "Terraform"
    Environment = var.environment
    Student     = var.student_name
    Project     = "wsb-cw1"
  }
}

# ── Zasób 1: bucket S3 ────────────────────────────────────────────────────────

resource "aws_s3_bucket" "main" {
  bucket = "${local.name_prefix}-bucket"

  tags = local.common_tags
}

# ── Zasób 2: blokada publicznego dostępu ─────────────────────────────────────

resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ── Zadanie samodzielne: dodaj szyfrowanie ────────────────────────────────────
# Dodaj tutaj resource aws_s3_bucket_server_side_encryption_configuration
# Dokumentacja: registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration
