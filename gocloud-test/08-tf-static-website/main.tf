# Create S3 Bucket Resource
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  #policy = file("policy.json")
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

//deinfe locals block to map web application's content-type in order to display the web page correctly
locals {
  content_type_map = {
    html = "text/html",
    js   = "application/javascript",
    css  = "text/css",
    svg  = "image/svg+xml",
    jpg  = "image/jpeg",
    ico  = "image/x-icon",
    png  = "image/png",
    gif  = "image/gif",
    pdf  = "application/pdf"
  }
}

resource "aws_s3_bucket_object" "file" {
  for_each = fileset(var.web_root, "**")

  bucket = data.aws_s3_bucket.s3_bucket.bucket
  key    = each.value
  source = "${var.web_root}/${each.value}"
  // content_type = "text/html"
  source_hash = filemd5("${var.web_root}/${each.value}")
  acl         = "public-read"
  //content_type = "text/html"
  //content_type = lookup(local.content_type_map, regex("\\.(?P<extension>[A-Za-z0-9]+)$", each.value).extension, "application/octet-stream")
  content_type = lookup(local.content_type_map, regex("\\.(?P<extension>[A-Za-z0-9]+)$", each.value).extension, "text/css")
}

//route 53
/*
resource "aws_route53_zone" "myzone" {
  name = var.domain_name
}
*/
data "aws_route53_zone" "myzone" {
  name         = var.domain_name
  
}

resource "aws_route53_record" "exampleDomain" {
  zone_id = data.aws_route53_zone.myzone.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_s3_bucket.s3_bucket.website_endpoint
    zone_id                = aws_s3_bucket.s3_bucket.hosted_zone_id
    evaluate_target_health = true
  }
}

//optional way to upload a web sourse code file to s3 bucket
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
