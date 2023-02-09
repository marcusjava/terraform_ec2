

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"


    tags = {
        Name = "MyNetwork"
    }
}


resource "aws_subnet" "public_subnets" {
    count = length(var.public_subnets_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.public_subnet_cidrs, count.index)

    tags = {
        Name = "Public Subnet ${count.index}"
    }

}

resource "aws_subnet" "private_subnets" {
    count = length(var.private_subnets_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.private_subnet_cidrs, count.index)

    tags = {
        Name = "Private Subnet ${count.index}"
    }

}