# Call our Custom Terraform Module which we built earlier

module "website_s3_bucket" {
  source      = "./modules/aws-s3-static-web"
  bucket_name = var.bucket_name
  tags        = var.s3_tags

}