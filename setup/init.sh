#!/bin/bash
oc login -u developer
oc new-project multiarch-aos;
oc create -f templates/multiarch-origin-build-template.yml
oc create -f templates/provision-multiarch-slave-template.yml
oc create -f templates/multiarch-slave-provisioner-builder-template.yml
oc new-app jenkins-slave-builder
