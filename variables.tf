variable "lab_name" {
  type        = string
  description = "Nombre del Laboratorio"
  validation {
    condition     = length(var.lab_name) >= 3
    error_message = "El nombre debe de ser mayor o igual a 3 caracteres."
  }
}
variable "key_name" {
  type        = string
  description = "Nombre de la llave SSH para conectar con el Bastion host"
}

variable "cidr_block" {
  type        = string
  description = "bloque de IP's para la VPC"
}

variable "public_cidr_block_a" {
  type        = string
  description = "Bloque de IP's para la subnet pública A"
}

variable "public_cidr_block_b" {
  type        = string
  description = "Bloque de IP's para la subnet pública B"
}

variable "private_cidr_block" {
  type        = string
  description = "Bloque de IP's para la subnet privada"
}
variable "public_zone_a" {
  type        = string
  description = "Zona de acceso público A"
}
variable "public_zone_b" {
  type        = string
  description = "Zona de acceso público B"
}
variable "private_zone" {
  type        = string
  description = "Zona de acceso privado"
}

## EC2 variales
variable "instance_name" {
}

## TargetGroup Vars
variable "tg_name" {}
variable "tg_port" {}
variable "tg_protocol" {}

##Loadbalancer vars
variable "lb_instance_name" {}
variable "load_balancer_type" {}
variable "lb_internal" {}
#variable "lb_subnets" {}
#variable "lb_security_groups" {}

variable "domain" {
  type = string
}

#variable "albWebserver" {
#  type = any
#}


