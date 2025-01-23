#provider,vpc,IGW,subnet,route-table,route-table-association,sg
provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "practice-Terraform" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "practice-Terraform"
  }
}

resource "aws_internet_gateway" "practice-Terraform-IGW" {
  vpc_id = aws_vpc.practice-Terraform.id

  tags = {
    Name = "practice-Terraform-IGW"
  }
}

resource "aws_subnet" "public-subnet1" {
  vpc_id     = aws_vpc.practice-Terraform.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet1"
  }
}

resource "aws_route_table" "practice-Terraform-RT" {
  vpc_id = aws_vpc.practice-Terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.practice-Terraform-IGW.id
  }
  tags = {
    Name    = "practice-Terraform-RT"
    service = "Terraform"
  }
}
resource "aws_route_table_association" "Terraform-RT-ass" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.practice-Terraform-RT.id
}

resource "aws_security_group" "Allow_all" {
  name        = "tcp"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.practice-Terraform.id
  ingress {
    from_port  = 0
    protocol   = "-1"
    to_port    = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
  description = "Allow all outbound traffic" 
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow_all"
  }
}
