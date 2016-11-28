#!/bin/bash

# /bin/bash
# exit 0

if [[ ! -d "/var/log/kolla/neutron" ]]; then
    mkdir -p /var/log/kolla/neutron
fi
if [[ $(stat -c %a /var/log/kolla/neutron) != "777" ]]; then
    sudo chmod 777 /var/log/kolla/neutron
    sudo chown -R neutron: /var/log/kolla/neutron
fi

# Bootstrap and exit if KOLLA_BOOTSTRAP variable is set. This catches all cases
# of the KOLLA_BOOTSTRAP variable being set, including empty.

if [[ "${!KOLLA_BOOTSTRAP[@]}" ]]; then
     neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head
     exit 0
fi
