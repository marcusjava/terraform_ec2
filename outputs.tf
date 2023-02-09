

output "dynamo_ip" {
  value = aws_instance.development_with_dynamodb.public_ip
}

output "bucket_ip" {
  value = aws_instance.development_with_bucket.public_ip
}