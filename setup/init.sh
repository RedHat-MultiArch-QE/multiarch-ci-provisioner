#!/bin/bash
oc login -u developer
oc new-project multiarch-provisioner;
oc create -f templates/multiarch-origin-build-template.yml
oc create -f templates/provisioner-template.yml
oc create -f templates/provision-multiarch-slave-template.yml
oc create -f templates/teardown-multiarch-slave-template.yml
oc new-app provisioner-builder
oc login -u system:admin
oc adm policy add-scc-to-user privileged system:serviceaccount:multiarch-provisioner:jenkins
oc login -u developer

exit 0
