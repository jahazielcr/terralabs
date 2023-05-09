
module "network" {
  source = "./network"

  lab_name            = var.lab_name
  cidr_block          = var.cidr_block
  public_cidr_block_a = var.public_cidr_block_a
  public_cidr_block_b = var.public_cidr_block_b
  private_cidr_block  = var.private_cidr_block
  public_zone_a       = var.public_zone_a
  public_zone_b       = var.public_zone_b
  private_zone        = var.private_zone


}


module "securityGroups" {
  source = "./securityGroups"
  vpc_id = module.network.vpc_id
}


module "ec2" {
  source                      = "./ec2"
  instance_type               = "t3a.nano"
  subnet_id                   = module.network.public_subnet_a.id
  instance_ami                = data.aws_ami.ubuntu.id
  vpc_security_group_ids      = [module.securityGroups.bastion_security_group_id]
  associate_public_ip_address = true
  lab_name                    = var.lab_name
  instance_name               = var.instance_name
  key_name                    = var.key_name
}

module "loadBalancer" {
  source             = "./loadBalancer"
  vpc_id             = module.network.vpc_id
  tg_name            = var.tg_name
  tg_port            = var.tg_port
  tg_protocol        = var.tg_protocol
  lb_instance_name   = var.lb_instance_name
  lab_name           = var.lab_name
  load_balancer_type = var.load_balancer_type
  lb_internal        = var.lb_internal
  lb_subnets         = [module.network.public_subnet_a.id, module.network.public_subnet_b.id]
  lb_security_groups = [module.securityGroups.public_http_security_group_id, module.securityGroups.public_https_security_group_id]
}


module "autoscaling" {
  source = "./autoscalingGroups"

  lab_name        = var.lab_name
  image_id        = data.aws_ami.ubuntu.id
  key_name        = var.key_name
  private_subnet  = module.network.private_subnet
  sgPrivate       = [module.securityGroups.private_allow_ssh_from_bastion_id, module.securityGroups.private_allow_http_from_bastion_id, module.securityGroups.private_allow_https_from_bastion_id]
  tgWebserver_arn = module.loadBalancer.tgWebserver_arn
}

#module "dns" {
#  source = "./dns"

#  lab_name     = var.lab_name
#  domain       = var.domain
#  albWebserver = module.loadBalancer.albWebserver
#}