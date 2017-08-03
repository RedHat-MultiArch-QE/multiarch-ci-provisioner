oc new-project multiarch-aos;
oc new-app jenkins-persistent;
oc create -f templates/multiarch-aos-origin-template.yml
oc create -f templates/multiarch-aos-e2e-template.yml
oc create -f templates/multiarch-aos-jenkins-slave-template.yml
oc new-app jenkins-slave-builder
