# Terraform Block
terraform {
  required_version = ">= 1.2.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-for-ec2"
    key    = "dev/project1-vpc/terraform.tfstate"
    region = "us-east-1" 

    # Enable during Step-09     
    # For State Locking
    dynamodb_table = "dev-project1-vpc"
    # dynamodb_table = "dev-project2-app1" 
  }    
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

# Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
