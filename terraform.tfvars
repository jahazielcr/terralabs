#keys vars
key_name = "mykey"

#VPC Vars
cidr_block          = "10.0.0.0/16"
public_cidr_block_a = "10.0.1.0/24"
public_cidr_block_b = "10.0.2.0/24"
private_cidr_block  = "10.0.3.0/24"
public_zone_a       = "us-east-1a"
public_zone_b       = "us-east-1b"
private_zone        = "us-east-1b"

#EC2 Vars
instance_name = "bastion-jahaziel"

#TargetGroup Vars
tg_name     = "tgWebsrv"
tg_port     = "80"
tg_protocol = "HTTP"

#LoadBalancer Vars

lb_instance_name   = "albWeb-jahaziel"
lb_internal        = "false"
load_balancer_type = "application"

## Autoscaling
#spot_price = "0.016"

domain = "aws-terralabs.tk"


