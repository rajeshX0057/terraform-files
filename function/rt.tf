resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name        = "${var.vpc_name}-public-RT"
    Owner       = local.Owner
    CostCenter  = local.CostCenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name        = "${var.vpc_name}-private-RT"
    Owner       = local.Owner
    CostCenter  = local.CostCenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "public-route-table" {
  #count = 3
  count          = length(var.public_cidr_block) # no need to enter count value 
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index + 1)
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private-route-table" {
  #count = 3
  count          = length(var.private_cidr_block) # no need to enter count value
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index + 1)
  route_table_id = aws_route_table.private-route-table.id
}