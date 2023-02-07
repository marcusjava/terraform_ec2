resource "aws_instance" "development" {
  count         = var.quantity
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key
  tags = {
    Name = "development_${count.index}"
  }

}