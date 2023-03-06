

/* output "dynamo_ip" {
  value = aws_instance.development_with_dynamodb.public_ip
}

output "bucket_ip" {
  value = aws_instance.development_with_bucket.public_ip
} */


output "ubuntu_ami" {
  value = data.aws_ami.ubuntu_ami
}