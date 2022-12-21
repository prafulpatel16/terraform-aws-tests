# Input variable definitions

variable "bucket_name" {
  description = "Name of the S3 bucket. Must be Unique across AWS"
  type        = string
  default     = "praful-bucket-2023"
}

variable "web_root" {
  type        = string
  description = "Path to the root of website content"
  default     = "./uploads"
}

## Create Variable for S3 Bucket Tags
variable "s3_tags" {
  description = "Tags to set on the bucket"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
    newtag1     = "tag1"
    newtag2     = "tag2"
  }
}