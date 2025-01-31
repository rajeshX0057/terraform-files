resource "aws_instance" "web-1" {
  ami                         = var.ami_id
  availability_zone           = var.ec2_az
  instance_type               = var.instance_type
  key_name                    = var.ssh_key
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Prod-Server"
    Env        = "Prod"
    Owner      = "rajesh"
    CostCenter = "ABCD"

}