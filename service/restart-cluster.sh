#!/bin/bash

echo "Enter the FQDN or IP address of the cluster:";
read ip_address;
route_address=$ip_address".xip.io";

sudo iptables -F;
sudo service docker restart;
nohup oc cluster up --public-hostname=$ip_address --routing-suffix=$route_address --host-data-dir=$HOME/origin;

exit 0
