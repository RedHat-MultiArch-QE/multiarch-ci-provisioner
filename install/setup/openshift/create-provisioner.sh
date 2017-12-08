#!/bin/bash
oc login -u developer
oc create -f templates/provisioner-template.yml
oc create -f templates/provision-multiarch-slave-template.yml
oc create -f templates/teardown-multiarch-slave-template.yml

# Read Kerberos Service Tenant
read -p "Kerberos Service Tenant: " ktenant

# Read Jenkins username
read -p "Jenkins Username: " username

# Read password
stty -echo
read -p "Jenkins Token: " token; echo
stty echo

oc create secret generic beaker --from-file images/provisioner/secrets/beaker/client.conf --from-file images/provisioner/secrets/beaker/id_rsa 
oc create secret generic krb5 --from-file images/provisioner/secrets/krb5/krb5.conf --from-file images/provisioner/secrets/krb5/krb5.keytab --from-literal tenant=${ktenant}
oc create secret generic jenkins --from-literal username=$username --from-literal password=$token

oc new-app provisioner-builder
oc login -u system:admin
oc adm policy add-scc-to-user privileged system:serviceaccount:redhat-multiarch-qe:jenkins
oc login -u developer

# List the jenkins token so you can easily copy it into the Jenkins instance
oc serviceaccounts get-token jenkins

exit 0
