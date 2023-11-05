variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "associate_public_ip_address" {
  type = bool
}

variable "vpc_security_group_ids" {
  type = list(string)
}
