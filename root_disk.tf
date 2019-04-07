resource "libvirt_volume" "this" {
  name = "${var.hostname}_root"
  pool = "${var.volume_pool}"
  base_volume_id = "${var.base_volume_id}"
}
