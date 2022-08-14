output "repository" {
  value       = "s3:s3.${aws_s3_bucket.restic_repository.region}.amazonaws.com/${aws_s3_bucket.restic_repository.id}"
  description = "The restric repository string pointing to the S3 bucket."
}

output "password" {
  value       = random_password.restic_password.result
  description = "The restric repository password."
  sensitive   = true
}

output "aws_s3_bucket_arn" {
  value       = aws_s3_bucket.restic_repository.arn
  description = "The AWS S3 Bucket ARN for the restic repository."
}

output "aws_access_key_id" {
  value       = aws_iam_access_key.restic_repository_access.id
  description = "The AWS_ACCESS_KEY_ID with permissions for the restic repository."
  sensitive   = true
}

output "aws_secret_access_key" {
  value       = aws_iam_access_key.restic_repository_access.secret
  description = "The AWS_SECRET_ACCESS_KEY with permissions for the restic repository."
  sensitive   = true
}
