terraform {
  required_version = ">= 1.14.6"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 3.4"
    }
  }
}

provider "openstack" {
  auth_url    = var.os_identity_endpoint
  domain_name = var.os_domain_name
  region      = var.os_region
  user_name   = var.os_username
  password    = var.os_password
  tenant_name = var.os_tenant_name
}
