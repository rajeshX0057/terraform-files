resource "aws_instance" "web-1" {
  ami                         = "ami-0e1bed4f06a3b463d"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = "practice-keypair"
  subnet_id                   = data.aws_subnet.Terraform_Public_Subnet1-testing.id
  vpc_security_group_ids      = ["${data.aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-1"
    Env        = "Prod"
    Owner      = "rajesh"
    CostCenter = "ABCD"
  }
}

terraform {
  backend "s3" {
    bucket = "rajesh-devops.xyz"
    key    = "current-state.tfstate"
    region = "us-east-1"
  }
}