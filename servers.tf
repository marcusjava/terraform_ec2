resource "aws_instance" "development" {
  count                  = var.quantity
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_https.id, aws_security_group.allow_http.id]
  tags = {
    Name = "development_${count.index}"
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

}