# Input variable definitions

variable "bucket_name" {
  description = "Name of the S3 bucket. Must be Unique across AWS"
  type        = string
}

variable "tags" {
  description = "Tags to set on the bucket"
  type        = map(string)
  default     = {}
}

variable "web_root" {
  type        = string
  description = "Path to the root of website content"
  default     = "./uploads"
}