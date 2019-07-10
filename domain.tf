resource "libvirt_domain" "this" {
  name = "${var.hostname}"

  cloudinit = "${libvirt_cloudinit_disk.this.id}"

  disk = ["${concat(list(local.root_disk), var.extra_disks)}"]

  console {
    type = "pty"
    target_port = "0"
    target_type = "serial"
  }

  network_interface = ["${local.networking_config}"]
}
