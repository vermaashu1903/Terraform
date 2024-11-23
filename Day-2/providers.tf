provider "aws" {
  alias   = "ap-south1"
  region  = "ap-south1"
  profile = "default"
}

provider "aws" {
  alias   = "us-east1"
  region  = "us-east1"
  profile = "default"
}

provider "azurerm" {
  subscription_id = "your-subscription-id"
  client_id = "client-id"
  client_secret = "client-secret"
  tenant_id = "tennant-id"
}