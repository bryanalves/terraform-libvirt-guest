variable "ssh_key" {
  type = "string"
}

variable "resolv_domain" {
  type = "string"
}

variable "resolv_nameservers" {
  type = "string"
}

variable "networking_bridge_iface" {
  default = "br0"
}

variable "os_flavor" {
  default = "centos_7"
}

variable "extra_cloud_config" {
  default = ""
}

variable "hostname" {
  type = "string"
}

variable "ip_address" {
  type = "string"
}

variable "gateway_address" {
  type = "string"
}

variable "volume_pool" {
  default = "default"
}

variable "base_volume_id" {
  type = "string"
}
