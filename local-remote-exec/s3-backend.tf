terraform {
  backend "s3" {
    bucket = "rajesh-devops.xyz"
    key    = "prod.tfstate"
    region = "us-east-1"
  }
}