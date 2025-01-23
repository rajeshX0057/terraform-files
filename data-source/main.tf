#provider,vpc,IGW,subnet,route-table,route-table-association,sg
provider "aws" {
  region = "us-east-1"
}


data "aws_vpc" "data-source" {
  id = "vpc-060c364109bdad790"
}

resource "aws_internet_gateway" "data-sourrce-IGW" {
  vpc_id = data.aws_vpc.data-source.id

  tags = {
    Name = "data-sourrce-IGW"
  }
}