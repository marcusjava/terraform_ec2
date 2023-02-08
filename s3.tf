resource "aws_s3_bucket" "development_with_bucket" {
  bucket = "dev-with-bucket"
  tags = {
    Name = "Development bucket on machine "
  }
}