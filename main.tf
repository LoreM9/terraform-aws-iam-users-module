# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::${var.organizations_account_id}:role/master_access"
  }
}
