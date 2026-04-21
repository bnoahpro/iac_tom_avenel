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
  type      = string
  sensitive = true
}

variable "os_identity_endpoint" {
  type      = string
  sensitive = true
}

variable "os_domain_name" {
  type      = string
  sensitive = true
}


####################################
#     Specific image variables     #
####################################

variable "source_image_name" {
  type      = string
}

variable "flavor" {
  type      = string
}

variable "image_name_prefix" {
  type      = string
}

variable "networks" {
  type      = list(string)
}

variable "ssh_username" {
  type      = string
}

variable "ssh_timeout" {
  type      = string
}