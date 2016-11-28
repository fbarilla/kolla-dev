#!/bin/bash

if [[ ! -d "/var/log/kolla/neutron" ]]; then
    mkdir -p /var/log/kolla/neutron
fi
# if [[ $(stat -c %a /var/log/kolla/neutron) != "755" ]]; then
#     sudo chmod 755 /var/log/kolla/neutron
    sudo chmod 777 /var/log/kolla/neutron
    sudo chown -R neutron: /var/log/kolla/neutron
# fi

source /usr/local/bin/kolla_neutron_extend_start
