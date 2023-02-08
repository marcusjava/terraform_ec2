provider "aws" {
  region = "us-east-1"
}


/*  
For multi region you can use alias
Usage with provider in resource module
provider = "aws.us-east-2"


*/
/* provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
} */