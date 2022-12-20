# creating key
resource "tls_private_key" "terraform-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
#generating key-value pair
resource "aws_key_pair" "terraform-key" {
  key_name   = "terraform-key"
  public_key = tls_private_key.terraform-key.public_key_openssh
}
# saving key to pem file
resource "local_file" "terraform-key" {
  content  = tls_private_key.terraform-key.private_key_pem
  filename = "/home/devops/.ssh/id_rsa.pub"
  depends_on = [
    tls_private_key.terraform-key
  ]
}

output "keypair_name" {

  value = aws_key_pair.terraform-key.key_name

}