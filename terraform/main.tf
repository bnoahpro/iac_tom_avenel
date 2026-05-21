# Clé SSH

data "openstack_networking_network_v2" "network_1" {
  name = var.private_network_name
}

data "openstack_networking_port_v2" "port_1" {
  device_id = openstack_compute_instance_v2.vm.id
}

resource "openstack_compute_instance_v2" "vm" {
  name        = "${var.vm_name_prefix}-${formatdate("YYYY-MM-DD", timestamp())}"
  image_name  = var.image_name
  flavor_name = var.flavor
  key_pair    = var.keypair_name
  network {
    name = var.private_network_name
  }
  lifecycle {
    ignore_changes = [
      image_name
    ]
  }
}

resource "openstack_networking_floatingip_associate_v2" "floating_ip_1_assoc" {
  floating_ip = var.floating_ip
  port_id = data.openstack_networking_port_v2.port_1.id
}
