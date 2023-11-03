provider "aws" {
    region = var.aws_region
    access_key = var.aws_access
    secret_key = var.aws_secret
}

resource "aws_s3_bucket" "tf-remote-state-bucket" {
    bucket = "wjdc-server-tf"
    tags = {
         Description = "Used as TF state repo."
    }
}

data "aws_iam_group" "wjdc-server-group" {
    group_name = "wjdc-admin-group"
}

output "iam-group-arn" {
  value       = "${data.aws_iam_group.wjdc-server-group.arn}"
}

data "aws_caller_identity" "current" {}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

resource "aws_s3_bucket_policy" "wjdc-server-policy" {
    bucket = aws_s3_bucket.tf-remote-state-bucket.id
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
          # List any additional actions your group needs
        ]
        Resource   = [
          "${aws_s3_bucket.tf-remote-state-bucket.arn}/*" # Bucket ARN and all objects
        ]
        Principal = {
          AWS = [
            data.aws_caller_identity.current.arn
          ]
        }
      }
    ]
  })
}

