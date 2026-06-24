variable "vpc_id" {
  description = "VPC ID where RDS will be deployed"
  type        = string
}

variable "private_subnet_1_id" {
  description = "Private subnet 1 ID"
  type        = string
}

variable "private_subnet_2_id" {
  description = "Private subnet 2 ID"
  type        = string
}

variable "private_sg_id" {
  description = "Private EC2 Security Group ID"
  type        = string
}

variable "db_username" {
  description = "RDS master username"
  type        = string
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}
