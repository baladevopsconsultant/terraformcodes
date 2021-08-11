terraform {
  backend "s3" {
    bucket = "s3bk123-tfstate-backend"
    key    = "remotedemo.tfstate"
    region = "us-east-1"
    dynamodb_table = "lockstate"
  }
}
