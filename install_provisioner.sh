#!/bin/bash
#
# Use this file to setup the OpenShift provisioner in a dedicated VM.

# Setup dependencies and docker
bash setup/install.sh

# Docker group should now be installed
group=docker
if [ $(id -gn) != $group ]; then
  exec sg $group "$0 $*"
fi

# Launch OpenShift cluster
bash setup/clusterup.sh

# Initialize projects within cluster
bash setup/init.sh
