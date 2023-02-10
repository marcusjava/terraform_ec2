provider "aws" {
  region = "us-east-1"
}

/* backend "s3" {
  bucket  = "ec2_config_state"
  region  = "us-east-1"
  key     = "ec2_config_tfstate"
  encrypt = true
}
 */

/*  
For multi region you can use alias
Usage with provider in resource module
provider = "aws.us-east-2"


*/
/* provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
} */