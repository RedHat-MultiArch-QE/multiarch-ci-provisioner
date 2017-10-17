#!/bin/bash
#
# Use this file to setup the OpenShift provisioner in a dedicated VM.

# Setup dependencies and docker
bash setup/install.sh

# Launch OpenShift cluster
bash setup/clusterup.sh

# Initialize projects within cluster
bash setup/init_openshift.sh
