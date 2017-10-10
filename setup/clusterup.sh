#!/bin/bash

# Ensure current user is in the docker group
group=docker
if [ $(id -gn) != $group ]; then
  exec sg $group "$0 $*"
fi

echo "Enter the IP address of the new cluster:";
read ip_address;
route_address=$ip_address".xip.io";

sudo iptables -F;
sudo service docker restart;
nohup oc cluster up --public-hostname=$ip_address --routing-suffix=$route_address;

exit 0
