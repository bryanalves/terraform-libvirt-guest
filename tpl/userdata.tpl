#cloud-config
# vim: syntax=yaml

cloud_config_modules:
  - resolv_conf
  - runcmd

ssh_authorized_keys:
  - ${ssh_key}

runcmd:
  - sed -i '/10.0.2.3/d' /etc/resolv.conf

manage-resolv-conf: true
resolv_conf:
  nameservers: ${resolv_nameservers}
  domain: ${resolv_domain}

${extra_cloud_config}
