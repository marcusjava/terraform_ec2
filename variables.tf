variable "quantity" {
  type        = string
  description = "Quantity of machines"
}

variable "ami" {
  type        = string
  description = "AMI image. Default to ubuntu in free tier candidate"
  default     = "ami-06878d265978313ca"

}

variable "instance_type" {
  type        = string
  description = "Instance type. Defaults to t2-micro"
  default     = "t2.micro"
}

variable "key" {
  type        = string
  description = "Name of key/par keys to access machines"
}


variable "public_subnets_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "List of public CIDRs"
}

variable "private_subnets_cidrs" {
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  description = "List of private CIDRs"
}

variable "zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "Availability Zones"
}