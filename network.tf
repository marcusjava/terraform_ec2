resource "aws_vpc" "my_vpc" {
  cidr_block           = "172.17.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "my_vpc"
  }

}


resource "aws_subnet" "my_public_subnets" {
  count                   = length(var.public_subnets_cidrs)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnets_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.zones[count.index]
  tags = {
    Name = "Public subnet on ${var.zones[count.index]}"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "Internet gateway"
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Public route table"
  }
}


resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  gateway_id             = aws_internet_gateway.ig.id
  destination_cidr_block = "0.0.0.0/0"

}

resource "aws_route_table_association" "publics_association" {
  count          = length(var.public_subnets_cidrs)
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = element(aws_subnet.my_public_subnets[*].id, count.index)
}




resource "aws_subnet" "my_private_subnets" {
  count                   = length(var.private_subnets_cidrs)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnets_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.zones[count.index]
  tags = {
    Name = "Private subnet on ${var.zones[count.index]}"
  }
}