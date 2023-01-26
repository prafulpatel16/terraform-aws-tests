resource "aws_s3_bucket" "s3_backend" {
  bucket = "prafectlink2023"
  acl    = "public-read-write"

}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.s3_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

