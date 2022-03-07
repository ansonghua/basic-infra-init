terraform {
  required_version = ">= 1.1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }

}

provider "aws" {
  region = var.region
}
terraform {
  backend "s3" {}
}

provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}
