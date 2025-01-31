terraform {
  backend "s3" {
    bucket = "rajesh-devops.xyz"
    key    = "workspace.statefile"
    region = "us-east-1"
  }
}