#cloud-config
# vim: syntax=yaml

ssh_authorized_keys:
  - ${ssh_key}

%{ if network == "static" }
cloud_config_modules:
  - resolv_conf
  - runcmd

runcmd:
  - sed -i '/10.0.2.3/d' /etc/resolv.conf

manage_resolv_conf: true
resolv_conf:
  nameservers: ${resolv_nameservers}
  domain: ${resolv_domain}
%{ endif }

${extra_cloud_config}
