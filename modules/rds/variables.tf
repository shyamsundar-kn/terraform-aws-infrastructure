variable "vpc_id" {}

variable "private_subnet_1_id" {}

variable "private_subnet_2_id" {}

variable "private_sg_id" {}

variable "db_username" {}

variable "db_password" {
  sensitive = true
}
