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
}
