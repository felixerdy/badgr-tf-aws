module "network" {
  source    = "./network"
  access_ip = var.access_ip
  vpc_cidr  = local.vpc_cidr
}

module "ec2" {
  source        = "./ec2"
  public_sg     = module.network.public_sg
  public_subnet = module.network.public_subnet
}

module "db" {
  source   = "./db"
  subnets  = module.network.private_subnet
  mysql_sg = module.network.mysql_sg
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

# module "alb" {
#   source        = "./alb"
#   vpc_id        = module.network.vpc_id
#   ec2_public_ip = module.ec2.ec2_public_ip
#   public_subnet = module.network.public_subnet
#   public_sg     = module.network.public_sg
# }