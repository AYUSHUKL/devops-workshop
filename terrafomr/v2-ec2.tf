provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo-server_new" {
  ami           = "ami-06c68f701d8090592"
  instance_type = "t2.micro"
  key_name      = "dpp"
  security_groups = [aws_security_group.demo-sg.name]  # Reference the security group by name

  tags = {
    Name = "EC2-INSTANCE"
  }
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-ssg"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "EC2-SECURITY-GROUP"
  }
}

