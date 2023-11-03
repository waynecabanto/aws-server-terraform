terraform {
    backend "s3" {
      bucket = "wjdc-server-tf"
      key = "aws/s3.tfstate"
      region = "us-east-1"
    }
}
