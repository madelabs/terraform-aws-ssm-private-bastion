terraform {
  required_version = ">= 1.5.2"

  required_providers {
    aws = {
      version = "~> 5.50.0"
      source  = "hashicorp/aws"
    }
  }
}
