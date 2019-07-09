version: 1
config:
  - type: physical
    name: ${net_device}
    subnets:
      - type: static
        address: ${ip}
        gateway: ${gateway}
