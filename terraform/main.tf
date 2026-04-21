# Clé SSH
resource "openstack_compute_keypair_v2" "keypair" {
  name       = var.keypair_name
  public_key = var.ssh_public_key
}

# Instance
resource "openstack_compute_instance_v2" "vm" {
  name        = "${var.vm_name_prefix}-${formatdate("YYYY-MM-DD", timestamp())}"
  image_name  = var.image_name
  flavor_name = var.flavor
  key_pair    = openstack_compute_keypair_v2.keypair.name
  network {
    name = var.network_name
  }
  lifecycle {
    ignore_changes = [
      image_name
    ]
  }
}
