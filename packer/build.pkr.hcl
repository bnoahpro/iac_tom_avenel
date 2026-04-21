build {
  sources = ["source.openstack.linux_template"]

  provisioner "shell" {
    inline = [
      "cloud-init status --wait || true",
      "sudo dnf update -y",
      "sudo dnf install -y vim curl git",
      "sudo setenforce 0"
    ]
  }
}