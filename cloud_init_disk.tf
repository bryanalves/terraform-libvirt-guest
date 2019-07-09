data "template_file" "vm_userdata" {
  template = "${file("${path.module}/tpl/userdata.tpl")}"
  vars = {
    ssh_key = "${var.ssh_key}"
    resolv_nameservers = "${jsonencode(var.resolv_nameservers)}"
    resolv_domain = "${var.resolv_domain}"
    extra_cloud_config = "${var.extra_cloud_config}"
  }
}

data "template_file" "vm_metadata" {
  template = "${file("${path.module}/tpl/metadata.tpl")}"
  vars = {
    hostname = "${var.hostname}"
    ip = "${var.ip_address}"
  }
}

data "template_file" "vm_static_networkdata" {
  template = "${file("${path.module}/tpl/static_networkdata.tpl")}"
  vars = {
    ip = "${var.ip_address}"
    gateway = "${var.gateway_address}"
    resolv_nameservers = "${jsonencode(var.resolv_nameservers)}"
    net_device = "${lookup(local.guest_netdevs, var.os_flavor)}"
  }
}

resource "libvirt_cloudinit_disk" "this" {
  name = "${var.hostname}_cloudinit"
  pool = "${var.volume_pool}"
  user_data = "${data.template_file.vm_userdata.rendered}"
  meta_data = "${data.template_file.vm_metadata.rendered}"
  network_config = "${var.network == "dhcp" ? "" : data.template_file.vm_static_networkdata.rendered}"
}
