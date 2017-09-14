#!/bin/bash

echo "Enter the IP address of the new cluster:"
read ip_address
route_address=$ip_address".xip.io"

sudo iptables -F;
sudo service docker restart;
oc cluster up --public-hostname=$ip_address --routing-suffix=$route_address;

