sudo oc login -u developer
sudo oc new-project multiarch-aos;
sudo oc new-app jenkins-persistent;
sudo oc create -f templates/multiarch-aos-origin-template.yml
sudo oc create -f templates/multiarch-aos-e2e-template.yml
sudo oc create -f templates/multiarch-aos-jenkins-slave-template.yml
sudo oc new-app jenkins-slave-builder
