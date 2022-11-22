# provide aws key pair for EC2 machine

resource "aws_key_pair" "key" {
  key_name   = "test-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Create EC2 machine

resource "aws_instance" "webserver" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]

}

# Null resource block to provide files from local to remote machine

resource "null_resource" "file_execute" {
  # Establish connection to EC2 machine
  connection {
    type        = "ssh"
    host        = aws_instance.webserver.public_ip
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
  }
  # Copy script file from local machine to remote machine
  provisioner "file" {
    source      = "prafuls-webapp.sh"
    destination = "/tmp/prafuls-webapp.sh"
  }
  # Execute script file to remote EC2 webserver machine
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/prafuls-webapp.sh",
      "sh /tmp/prafuls-webapp.sh",
    ]
  }

  depends_on = [aws_instance.webserver]

}

output "Prafuls-Webserver-Public-IP" {
  value = aws_instance.webserver.public_ip
}


#Create SG for allowing TCP/80 & TCP/22
resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TCP/80 & TCP/22"
  vpc_id      = var.vpc
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
