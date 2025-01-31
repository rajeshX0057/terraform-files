terraform {
  backend "s3" {
    bucket = "rajesh-devops.xyz"
    key    = "Base-Infra.tfstate"
    region = "us-east-1"
  }
}