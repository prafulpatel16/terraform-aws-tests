# Output variable definitions

output "website_cdn_root_id" {
  description = "Main CloudFront Distribution ID"
  value       = aws_cloudfront_distribution.website_cdn_root.id
}

output "website_root_s3_bucket" {
  description = "The website root bucket where resources are uploaded"
  value       = aws_s3_bucket.website_root.bucket
}

output "website_logs_s3_bucket" {
  description = "The s3 bucket of the website logs"
  value       = aws_s3_bucket.website_logs.bucket
}

output "website_redirect_s3_bucket" {
  description = "The s3 bucket of the website redirect bucket"
  value       = aws_s3_bucket.website_redirect.bucket
}


output "arn" {
  description = "ARN of the S3 Bucket"
  value       = aws_s3_bucket.website_root.arn
}

output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.website_root.id
}

output "domain" {
  description = "Domain Name of the bucket"
  value       = aws_s3_bucket.website_root.website_domain
}

output "endpoint" {
  description = "Endpoint Information of the bucket"
  value       = aws_s3_bucket.website_root.website_endpoint
}

