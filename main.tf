module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.vpc.public_subnet_id
  private_subnet_id  = module.vpc.private_subnet_1_id
}

module "rds" {
  source = "./modules/rds"

  vpc_id              = module.vpc.vpc_id
  private_subnet_1_id = module.vpc.private_subnet_1_id
  private_subnet_2_id = module.vpc.private_subnet_2_id

  private_sg_id       = module.ec2.private_sg_id

  db_username         = var.db_username
  db_password         = var.db_password
}
