# terraform-libvirt-guest

Wrapper around https://github.com/dmacvicar/terraform-provider-libvirt that will create a cloud-init disk, a root volume, and an opinionated set of configuration to boot a guest.

# Usage

```
module "vm1" {
  source = "github.com/bryanalves/terraform-libvirt-guest"
  hostname = "vm1"

  ssh_key = "${local.ssh_key}"

  ip_address = "192.168.100.2/24"
  gateway_address = "192.168.100.1"

  resolv_domain = "example.com"
  resolv_nameservers = "8.8.8.8"

  base_volume_id = "${local.centos_id}" # From terraform-libvirt-base-images
  guest_net_device = "${local.centos_netdev}" # From terraform-libvirt-base-images
}
```

The cloud-init disks are very opinionated and include enough specification to boot Debian 9.8, Centos 7, and Ubuntu Cosmic.  See https://github.com/bryanalves/terraform-libvirt-base-images for a module to make these base images be available for use in an easy way.
