resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.acl 
  lifecycle_rule {
    id      = var.lg_id
    enabled = var.lg_enabled

    prefix = var.lg_prefix

    expiration {
      days = var.lg_expir_days
    }
  }

 lifecycle_rule {
    id      = var.im_id
    enabled = var.im_enabled

    prefix = var.im_prefix

      transition {
      days          = var.im_trans_days
      storage_class = var.im_storage_class
    }
  }
}