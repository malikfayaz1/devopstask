#  log buckets should have logging enabled
resource "aws_s3_bucket" "log_bucket" {
  bucket = "${var.project}-${var.env}-log-bucket"
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.log_bucket.id
  acl    = "log-delivery-write"
}

# log buckets should have minimal replication and storage class of Intelligent Tiering - Deep Archive Access Tier
resource "aws_s3_bucket_intelligent_tiering_configuration" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.bucket
  name   = "${var.project}-${var.env}-log-bucket-it"

  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = 180
  }
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 125
  }
}

#  log buckets should implement versioning
resource "aws_s3_bucket_versioning" "log_bucket_versioning" {
  bucket = aws_s3_bucket.log_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "log_bucket_encryption" {
  bucket = aws_s3_bucket.log_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.log_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# key
resource "aws_kms_key" "log_bucket_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}