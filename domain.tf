resource "libvirt_domain" "this" {
  name = "${var.hostname}"

  cloudinit = "${libvirt_cloudinit_disk.this.id}"

  disk {
    volume_id = "${libvirt_volume.this.id}"
  }

  console {
    type = "pty"
    target_port = "0"
    target_type = "serial"
  }

  network_interface {
    bridge = "${var.networking_bridge_iface}"
  }
}
