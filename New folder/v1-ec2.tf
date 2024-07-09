provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "demo-server" {
ami ="ami-06c68f701d8090592"
instance_type = "t2.micro"
key_name = "dpp"
  
}