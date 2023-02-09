

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"


  tags = {
    Name = "MyNetwork"
  }
}


resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "MyNetwork Internet Gateway"
  }

}


resource "aws_route_table" "second_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {

    Name = "2nd Route Table"

  }
}


resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnets_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.zones, count.index)

  tags = {
    Name = "Public Subnet ${count.index}"
  }

}
resource "aws_route_table_association" "public_subnet_association" {
    count = length(var.public_subnet_cidrs)
    subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
    route_table_id = aws_route_table.second_route.id
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnets_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.zones, count.index)

  tags = {
    Name = "Private Subnet ${count.index}"
  }

}