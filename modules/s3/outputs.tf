output "s3_bucket_arn" {
  value = aws_s3_bucket.microservice_bucket.arn
}

output "s3_bucket_id" {
  value = aws_s3_bucket.microservice_bucket.id
}

output "s3_bucket_region" {
  value = aws_s3_bucket.microservice_bucket.region
}