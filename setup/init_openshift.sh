#!/bin/bash
oc login -u developer
oc new-project multiarch-provisioner
oc create -f templates/provisioner-template.yml
oc create -f templates/multiarch-origin-build-template.yml
oc create -f templates/provision-multiarch-slave-template.yml
oc create -f templates/teardown-multiarch-slave-template.yml

# Read username
read -p "Gitlab username: " username

# Read password
stty -echo
read -p "Gitlab token: " token; echo
stty echo

oc create secret generic gitlab --from-literal=username=$username --from-literal=password=$token --namespace=multiarch-provisioner
oc secrets link builder gitlab --for=pull --namespace=multiarch-provisioner
oc new-app provisioner-builder
oc login -u system:admin
oc adm policy add-scc-to-user privileged system:serviceaccount:multiarch-provisioner:jenkins
oc login -u developer
# List the jenkins token so you can easily copy it into the Jenkins instance
oc serviceaccounts get-token jenkins

exit 0
