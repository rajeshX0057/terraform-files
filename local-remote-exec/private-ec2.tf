#resource "aws_instance" "private-server" {
#  #count = length(var.private_cidr_block)
#  count = var.environment == "prod" ? 3 : 1
#
#  ami                    = lookup(var.amis, var.aws_region)
#  instance_type          = "t2.micro"
#  key_name               = var.key_name
#  subnet_id              = element(aws_subnet.private-subnet.*.id, count.index + 1)
#  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
#  #associate_public_ip_address = true
#  tags = {
#    Name        = "${var.vpc_name}-private-server-${count.index + 1}"
#    Owner       = local.Owner
#    CostCenter  = local.CostCenter
#    TeamDL      = local.TeamDL
#    environment = "${var.environment}"
#  }
#}
#