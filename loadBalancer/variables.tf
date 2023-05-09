#TargetGroup vars
variable "tg_name" {}
variable "tg_port" {}
variable "tg_protocol" {}
variable "vpc_id" {}

#LoadBalancer vars
variable "lb_instance_name" {}
variable "lab_name" {}
variable "load_balancer_type" {}
variable "lb_internal" {}
variable "lb_subnets" {}
variable "lb_security_groups" {}
