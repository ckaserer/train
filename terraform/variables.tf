variable "aws_region" {
  type = string
  default = "us-west-2"
  description = ""
}

variable "bootstrap_file" {
  type = string
  default = "helloworld.sh"
  description = ""
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = ""
}

variable "num_participants" {
  type = number
  description = ""
}

variable "resource_prefix" {
  type = string
  description = ""
}

variable "owner" {
  type = string
  description = ""
}
