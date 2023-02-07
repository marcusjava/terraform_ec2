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