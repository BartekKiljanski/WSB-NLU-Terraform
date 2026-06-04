variables {
  bucket_name = "test-wsb-bartlomiej-kiljanski-cw4-892099015533"
  environment = "dev"
}

run "bucket_created_with_correct_name" {
  command = apply

  assert {
    condition     = aws_s3_bucket.this.id == var.bucket_name
    error_message = "Bucket name does not match the requested value."
  }
}

run "public_access_is_blocked" {
  command = plan

  assert {
    condition     = aws_s3_bucket_public_access_block.this.block_public_acls == true
    error_message = "Public ACLs should be blocked."
  }

  assert {
    condition     = aws_s3_bucket_public_access_block.this.block_public_policy == true
    error_message = "Public bucket policies should be blocked."
  }
}

run "versioning_suspended_by_default" {
  command = plan

  assert {
    condition     = aws_s3_bucket_versioning.this.versioning_configuration[0].status == "Suspended"
    error_message = "Versioning should be Suspended by default."
  }
}

run "versioning_can_be_enabled" {
  command = plan

  variables {
    enable_versioning = true
  }

  assert {
    condition     = aws_s3_bucket_versioning.this.versioning_configuration[0].status == "Enabled"
    error_message = "Versioning should be Enabled when enable_versioning is true."
  }
}

run "invalid_name_rejected" {
  command = plan

  variables {
    bucket_name = "WIELKIE-LITERY"
  }

  expect_failures = [var.bucket_name]
}

run "bucket_encryption_is_enabled" {
  command = apply

  assert {
    condition = alltrue([
      for rule in aws_s3_bucket_server_side_encryption_configuration.this.rule :
      alltrue([
        for default_encryption in rule.apply_server_side_encryption_by_default :
        default_encryption.sse_algorithm == "AES256"
      ])
    ])
    error_message = "Bucket encryption should use AES256."
  }
}
