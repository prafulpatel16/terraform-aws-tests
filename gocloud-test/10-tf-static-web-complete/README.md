## Static Web application deployment using Terraform & AWS S3

- [Instructions](./instructions.md)

#

### Instructions and Information
*TODO - Fill this out with whatever information you feel is necessary.*

### Content
# webfiles, uploads all these folders content a web app source code


AWS Certificate Manager: wildcard certificate for your domain.
S3
Bucket #1: to store logs.
Bucket #2: to store the content (example.com).
Bucket #3: to redirect a different subdomain to the main domain (e.g., www.example.com redirected to example.com).
CloudFront
Distribution #1: to frontend the website.
Distribution #2: to frontend the subdomain that will be redirected to the main domain.
Route53 record sets pointing to the two CloudFront distributions.