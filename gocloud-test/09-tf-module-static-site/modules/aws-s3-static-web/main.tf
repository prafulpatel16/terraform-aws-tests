# Create S3 Bucket Resource
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::${var.bucket_name}/*"
          ]
      }
  ]
}  
EOF
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags          = var.tags
  force_destroy = true
}

data "aws_s3_bucket" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.bucket
}
/*
resource "aws_s3_object" "object-upload-html" {
  for_each     = fileset("uploads/", "*.html")
  bucket       = data.aws_s3_bucket.s3_bucket.bucket
  key          = each.value
  source       = "uploads/${each.value}"
  content_type = "text/html"
  etag         = filemd5("uploads/${each.value}")
  acl          = "public-read"
}
resource "aws_s3_object" "object-upload-jpg" {
  for_each     = fileset("uploads/", "*.jpg")
  bucket       = data.aws_s3_bucket.s3_bucket.bucket
  key          = each.value
  source       = "uploads/${each.value}"
  content_type = "image/jpeg"
  etag         = filemd5("uploads/${each.value}")
  acl          = "public-read"
}
resource "aws_s3_object" "object-upload-css" {
  for_each     = fileset("uploads/", "*.css")
  bucket       = data.aws_s3_bucket.s3_bucket.bucket
  key          = each.value
  source       = "uploads/${each.value}"
  content_type = "image/jpeg"
  etag         = filemd5("uploads/${each.value}")
  acl          = "public-read"
}
*/

resource "aws_s3_bucket_object" "file" {
  for_each = fileset(var.web_root, "**")

  bucket       = data.aws_s3_bucket.s3_bucket.bucket
  key          = each.value
  source       = "${var.web_root}/${each.value}"
  content_type = "text/html"
  source_hash  = filemd5("${var.web_root}/${each.value}")
  acl          = "public-read"
}
