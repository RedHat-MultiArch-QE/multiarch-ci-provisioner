#!/bin/bash
sudo yum install -y git docker firewalld;
curl -L -O https://github.com/openshift/origin/releases/download/v3.6.0/openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit.tar.gz
tar xvzf openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit.tar.gz;
sudo cp openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit/oc /bin;

# Start Services
sudo systemctl enable docker;
sudo systemctl enable firewalld;
sudo systemctl start docker;
sudo systemctl start firewalld;

# Allow OpenShift docker registry
echo "INSECURE_REGISTRY='--insecure-registry 172.30.0.0/16'" | sudo tee -a /etc/sysconfig/docker;
echo "{ \"mtu\": 1400 }" | sudo tee /etc/docker/daemon.json;

# Open up ports for connections to docker
sudo firewall-cmd --permanent --new-zone dockerc;
sudo firewall-cmd --permanent --zone dockerc --add-source 172.17.0.0/16;
sudo firewall-cmd --permanent --zone dockerc --add-port 8443/tcp;
sudo firewall-cmd --permanent --zone dockerc --add-port 53/udp;
sudo firewall-cmd --permanent --zone dockerc --add-port 8053/udp;
sudo firewall-cmd --permanent --zone dockerc --add-port 50000/tcp;
sudo firewall-cmd --reload;

# Allow sudoless docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
