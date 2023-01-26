# Create S3 Bucket Resource
resource "aws_s3_bucket" "b" {
  bucket = "test-bucket-remote2023"
  acl    = "private"
   force_destroy = true

  versioning {
    enabled = true
  }
}