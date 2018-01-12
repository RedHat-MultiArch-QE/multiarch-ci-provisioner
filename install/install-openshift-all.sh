#!/bin/bash
#
# Use this file to setup the OpenShift provisioner in a dedicated VM.
root_dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/..
cd $root_dir

# Initialize projects within cluster
bash $root_dir/install/setup/openshift/create-project.sh
bash $root_dir/install/setup/openshift/create-provisioner.sh
