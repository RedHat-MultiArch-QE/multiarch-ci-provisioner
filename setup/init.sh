#!/bin/bash
oc login -u developer
oc new-project multiarch-provisioner;
oc create -f templates/multiarch-origin-build-template.yml
oc create -f templates/provisioner-template.yml
oc create -f templates/provision-multiarch-slave-template.yml
oc create -f templates/teardown-multiarch-slave-template.yml
oc new-app provisioner-builder
oc adm policy add-scc-to-user priviledged default
