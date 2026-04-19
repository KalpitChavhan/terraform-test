terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.8.0"
    }
  }

    backend "s3" {
      bucket = "backend-module-bucket-mod-project-apr2026"
      key    = "dev/terraform.tfstate"
      region = "ap-south-1"
      #use_lockfile = true #lockfile
      #dynamodb_table = "terraform-lock"
    }
 }