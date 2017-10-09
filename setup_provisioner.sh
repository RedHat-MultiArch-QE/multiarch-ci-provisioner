#!/bin/bash
#
# Use this file to setup the OpenShift provisioner in a dedicated VM.
#
set -o pipefail
. setup/install.sh || true
. setup/clusterup.sh || true
. setup/init.sh
