data "aws_vpc" "terraform-aws-testing" {
  id = "vpc-02346c96e8ccd406d"
}
data "aws_security_group" "allow_all" {
  id = "sg-0a638553165545c15"
}
data "aws_subnet" "Terraform_Public_Subnet1-testing" {
  id = "subnet-0eeb11b7f3327a022"
}

