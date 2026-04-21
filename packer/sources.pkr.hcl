source "openstack" "linux_template" {
  identity_endpoint = var.os_identity_endpoint
  domain_name       = var.os_domain_name
  tenant_name       = var.os_tenant_name
  username          = var.os_username
  password          = var.os_password
  region            = var.os_region

  source_image_name   = var.source_image_name
  flavor              = var.flavor
  image_name          = "${var.image_name_prefix}-${formatdate("YYYY-MM-DD", timestamp())}"
  networks            = var.networks

  ssh_username = var.ssh_username
  ssh_timeout  = var.ssh_timeout
}