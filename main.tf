terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.25.0"
    }
  }
}

resource "random_password" "restic_password" {
  length = 128
}

resource "aws_s3_bucket" "restic_repository" {
  bucket = var.name

  force_destroy = var.force_destroy
}

data "aws_iam_policy_document" "restic_repository_access" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
    ]
    resources = [
      aws_s3_bucket.restic_repository.arn
    ]
  }

  statement {
    actions = [
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:PutObject",
    ]
    resources = [
      "${aws_s3_bucket.restic_repository.arn}/*"
    ]
  }
}

resource "aws_iam_user_policy" "restic_repository_access" {
  name = var.name
  user = aws_iam_user.restic_repository_access.name

  policy = data.aws_iam_policy_document.restic_repository_access.json
}

resource "aws_iam_user" "restic_repository_access" {
  name = var.name
}

resource "aws_iam_access_key" "restic_repository_access" {
  user = aws_iam_user.restic_repository_access.name
}
