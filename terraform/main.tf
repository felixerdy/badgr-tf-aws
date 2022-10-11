module "network" {
  source    = "./network"
  access_ip = var.access_ip
  vpc_cidr  = local.vpc_cidr
  elb_sg    = module.elb.elb_sg
}

module "ec2" {
  source        = "./ec2"
  public_sg     = module.network.public_sg
  public_subnet = module.network.public_subnet
}

module "db" {
  source      = "./db"
  subnets     = module.network.private_subnet
  mysql_sg    = module.network.mysql_sg
  db_password = var.db_password
}

module "memcached" {
  source = "./memcached"
}

module "s3" {
  source = "./s3"
}

module "iam" {
  source = "./iam"
}

module "elb" {
  source           = "./elb"
  ec2_instance_ids = module.ec2.ec2_instance_ids
  public_sg        = module.network.public_sg
  available_azs    = module.network.available_azs
  subnets          = [module.network.public_subnet]
  vpc              = module.network.vpc_id
}
