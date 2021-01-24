provider "aws" {
  region  = var.region
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "microservice-state-bucket"
    key     = "microservice.tfstate"
    region  = "eu-west-1"
  }
}