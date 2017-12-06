#!/bin/bash
oc login -u developer
oc new-project redhat-multiarch-qe
oc new-app jenkins-persistent
oc create -f templates/provisioner-template.yml
oc create -f templates/multiarch-origin-build-template.yml
oc create -f templates/provision-multiarch-slave-template.yml
oc create -f templates/teardown-multiarch-slave-template.yml

# Read Jenkins username
read -p "Jenkins username: " username

# Read password
stty -echo
read -p "Jenkins token: " token; echo
stty echo

oc create secret generic beaker --from-file images/provisioner/secrets/beaker/beaker.conf --from-file images/provisioner/secrets/beaker/id_rsa
oc create secret generic krb5 --from-file images/provisioner/secrets/krb5/krb5.conf --from-file images/provisioner/secrets/krb5/krb5.keytab
oc create secret generic jenkins --from-literal username=$username --from-liter password=$token

oc new-app provisioner-builder
oc login -u system:admin
oc adm policy add-scc-to-user privileged system:serviceaccount:multiarch-provisioner:jenkins
oc login -u developer
# List the jenkins token so you can easily copy it into the Jenkins instance
oc serviceaccounts get-token jenkins

exit 0
