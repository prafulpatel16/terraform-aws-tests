provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAQTDB4QXC3NY3HUQK"
  secret_key = "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"
}


resource "aws_key_pair" "key" {
  key_name   = "test-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

#Create and bootstrap webserver

resource "aws_instance" "myec2" {
  ami                         = "ami-0b0dcb5067f052a63"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]

  }

}
output "Webserver-Public-IP" {
  value = aws_instance.myec2.public_ip
}

#Create SG for allowing TCP/80 & TCP/22
resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TCP/80 & TCP/22"
  vpc_id      = "	vpc-0adc0ce332b18fbf6"
  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow traffic from TCP/80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


























/*
resource "null_resource" "copy_execute" {

  connection {
    type        = "ssh"
    host        = aws_instance.webserver.public_ip
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
  }


  provisioner "file" {
    source      = "amzn-web-app.sh"
    destination = "/tmp/amzn-web-app.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/amzn-web-app.sh",
      "sh /tmp/amzn-web-app.sh",
    ]
  }

  depends_on = [aws_instance.webserver]

}

*/