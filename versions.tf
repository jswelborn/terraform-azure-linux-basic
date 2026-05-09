terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "aws" {
  region = local.aws_region

  assume_role {
    role_arn = local.aws_assume_role_arn
  }
}