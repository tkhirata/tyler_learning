variable "ami" {
  description = "This is the AMI for the instance"
  type        = string
  default     = "ami-05f991c49d264708f"
}

variable "instance_type" {
  description = "This is the instance type"
  type        = string
  default     = "t2.micro"
}
