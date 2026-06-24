variable "aws_region" {
  default = "us-east-1"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  sensitive = true
}
