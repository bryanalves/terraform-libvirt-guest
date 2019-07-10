locals {
  guest_netdevs = {
    centos_7 = "eth0"
    debian_9_8 = "eth0"
    ubuntu_cosmic = "ens3"
  }

  root_disk = {
    volume_id = "${libvirt_volume.this.id}"
  }

  networking_config = {
    bridge = "${var.networking_bridge_iface}"
    mac = "${var.mac_address}"
  }
}
