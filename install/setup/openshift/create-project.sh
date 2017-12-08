#!/bin/bash
oc login -u developer
oc new-project redhat-multiarch-qe
oc new-app jenkins-persistent

exit 0
