#This Terraform Code Deploys Basic VPC Infra.
#data "aws_ami" "my_ami" {
#  most_recent = true
#  #name_regex       = "^sai"
#  owners = ["232323232323232323"]
#}


# resource "aws_instance" "web-1" {
#     ami = "${data.aws_ami.my_ami.id}"
#     #ami = "ami-0d857ff0f5fc4e03b"
#     availability_zone = "us-east-1a"
#     instance_type = "t2.micro"
#     key_name = "LaptopKey"
#     subnet_id = "${aws_subnet.subnet1-public.id}"
#     vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
#     associate_public_ip_address = true	
#     tags = {
#         Name = "Server-1"
#         Env = "Prod"
#         Owner = "sai"
# 	CostCenter = "ABCD"
#     }
#      user_data = <<- EOF
#      #!/bin/bash
#      	sudo apt-get update
#      	sudo apt-get install -y nginx
#      	echo "<h1>${var.env}-Server-1</h1>" | sudo tee /var/www/html/index.html
#      	sudo systemctl start nginx
#      	sudo systemctl enable nginx
#      EOF

# }

#resource "aws_dynamodb_table" "state_locking" {
#  hash_key = "LockID"
#  name     = "dynamodb-state-locking"
#  attribute {
#    name = "LockID"
#    type = "S"
#  }
#  billing_mode = "PAY_PER_REQUEST"
#}

##output "ami_id" {
#  value = "${data.aws_ami.my_ami.id}"
#}
#!/bin/bash
# echo "Listing the files in the repo."
# ls -al
# echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
# echo "Running Packer Now...!!"
# packer build -var=aws_access_key=AAAAAAAAAAAAAAAAAA -var=aws_secret_key=BBBBBBBBBBBBB packer.json
# echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
# echo "Running Terraform Now...!!"
# terraform init
# terraform apply --var-file terraform.tfvars -var="aws_access_key=AAAAAAAAAAAAAAAAAA" -var="aws_secret_key=BBBBBBBBBBBBB" --auto-approve
