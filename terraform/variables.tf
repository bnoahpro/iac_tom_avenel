############################
#     Common variables     #
############################
variable "os_username" {
  type      = string
  sensitive = true
}

variable "os_password" {
  type      = string
  sensitive = true
}

variable "os_tenant_name" {
  type      = string
  sensitive = true
}

variable "os_region" {
  type = string
}

variable "os_identity_endpoint" {
  type = string
}

variable "os_domain_name" {
  type = string
}


########################
#     VM variables     #
########################

variable "image_name" {
  type = string
}

variable "flavor" {
  type = string
}

variable "vm_name_prefix" {
  type = string
}

variable "private_network_name" {
  type = string
}

variable "floating_ip" {
  type = string
}


#############################
#     Keypair variables     #
#############################

variable "ssh_public_key" {
  type = string
}

variable "keypair_name" {
  type = string
}