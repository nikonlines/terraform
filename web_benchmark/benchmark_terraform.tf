terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "test_webserver" {
  count = 6
  ami = "ami-05f7491af5eef733a"
  instance_type = "t3.micro"

  #vpc_security_group_ids = [aws_security_group.webserver_security_group.id]
  user_data = file("benchmark_script.sh")
}

resource "aws_security_group" "webserver_security_group" {
  name = "WebServer Security Group"
  description = "WebServer Security Group"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

