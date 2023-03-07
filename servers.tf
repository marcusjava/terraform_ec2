

resource "aws_instance" "public_machines" {
  count                  = var.quantity
  ami                    = data.aws_ami.ubuntu_ami
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_https.id, aws_security_group.allow_http.id]
  subnet_id              = aws_subnet.public_subnets[count.index].id
  tags = {
    Name = "Public_${count.index}"
  }

} 




resource "aws_instance" "private_machines" {
  count                  = var.quantity
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_https.id, aws_security_group.allow_http.id]
  subnet_id              = aws_subnet.private_subnets[count.index].id
  tags = {
    Name = "Private_${count.index}"
  }

}  


/* resource "aws_dynamodb_table" "dynamodb-table" {
  name         = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserId"
  range_key    = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }


  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}

resource "aws_instance" "development_with_dynamodb" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_https.id, aws_security_group.allow_http.id]
  depends_on = [
    aws_dynamodb_table.dynamodb-table
  ]
  tags = {
    Name = "development_with_dynamodb"
  }

}

resource "aws_instance" "development_with_bucket" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_https.id, aws_security_group.allow_http.id]
  depends_on = [
    aws_s3_bucket.development_with_bucket
  ]
  tags = {
    Name = "development_with_bucket"
  }

} */