aws_region         = "us-east-1"
vpc_cidr           = "172.18.0.0/16"
vpc_name           = "devsecops-vpc"
key_name           = "practice-keypair"
azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_cidr_block  = ["172.18.1.0/24", "172.18.2.0/24", "172.18.3.0/24"]
private_cidr_block = ["172.18.10.0/24", "172.18.20.0/24", "172.18.30.0/24"]
environment        = "prod"
ingress_service    = ["22", "80", "8080", "443", "8443", "3306", "1900", "1443"]
amis = {
  us-east-1 = "ami-0e1bed4f06a3b463d"
  us-east-2 = "ami-0884d2865dbe9de4b"
}