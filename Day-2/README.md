# Terraform DAY_2

## Providers
In simple words we can say providers are the plugins that acts as a mediator between the terraform and the cloud provider
e.g. 
provider "aws" {
  region = "ap-south1"  # region name, in which you want to create resources
  profile = "default"   # profile name under which you configured your aws credentials
}

## Things to cover in DAY-2
    - Multiple-regions
    - Multiple-clouds

### Multiple-Regions
- If we want to create multiple regions we create aliases and then use them inside resources section.

e.g.
provider "aws" {
  alias  = "ap-south1"
  region = "ap-south1"
}

provider "aws" {
  alias  = "us-east1"
  region = "us-east1"
}

resource "aws_instance" "example" {
  count                 = 1
  key_name              = "aws-test"
  subnet_id             = "sb-1231321123"
  instance_type         = "t2-micro"
  provider              = aws.ap-south1
}

resource "aws_instance" "example" {
  count                 = 1
  key_name              = "aws-test"
  subnet_id             = "sb-1231321123"
  instance_type         = "t2-micro"
  provider              = aws.us-east1
}

Note: 
- Alias name can be anything. It is not mandatory to use region name as alias name... you can also use abc as alias name. e.g. alias = "abc"

# Multiple-Clouds
- If you want to configure multiple clouds in a single terraform project, you can simple mention their respective provider names in different blocks
e.g.
provider "aws" {
  region = "ap-south1"
  profile = "default"
}

provider "azurerm" {
  subscription
}