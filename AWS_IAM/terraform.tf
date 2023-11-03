terraform {
    backend "s3" {
        bucket = "wjdc-server-tf"
        key = "aws/iam.tfstate"
        region = "us-east-1"
    }
}
