# Input variable definitions

variable "instance_class" {
  description = "Instance Class"
  type        = string
}

variable "application_name" {
  description = "Application name"
  type        = string
}

variable "cluster_name" {
  description = "Cluster Name"
  type        = string
}

variable "username_admin" {
  description = "Username"
  type        = string
}

variable "password_admin" {
  description = "Password"
  type        = string
}

variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type        = list
}

variable "vpc_sg_id" {
  description = "VPC Security Group"
  type        = string
}