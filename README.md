# multiarch-ci-provisioner
The RedHat Multi-Arch QE provisioner project is an effort to provide Jenkins CI users with an easy way build and test packages across all architectures. It is meant to go hand in hand with the multiarch-test-template project so that users can get up and running with their tests quickly. Currently this project is only expected to work in RedHat's internal enviroment, we are making active progress towards supporting general usage.

## Getting Started
The first step to using the multiarch-ci-provisioner is where you need to do a full install on the system, or just install the OpenShift components into your existing cluster.

### Full Install
1. Create a standalone VM.
2. Run the `install/install-all.sh'

### Install Using Pre-Existing OpenShift Cluster
1. 
2. 

## Jenkins Setup
### Jenkins Plugin Dependencies
Beyond the OpenShift Jenkins image plugins, you'll need to install these plugins to get the provisioner running.
1. AnsiColor
2. Timestamper
3. Self-Organizing Swarm Plugin

### Jenkins Secrets
In order to run the provisioner, you'll need to have 3 secret files uploaded as Jenkins credentials:
1. `KEYTAB`
Kerberos keytab that will be used to authenticate to beaker.
2. `SSHPUBKEY`
SSH public key that will be installed on the provisioned node.
3. `SSHPRIVKEY`
SSH private key to connect to the provisioned node.

It is recommended that the key pair be used only to connect your Jenkins node to the provisioned host.

### Cinch Configuration
Depending on whether the Jenkins instance is run in an OpenShift cluster, you'll need to override the following variables to connect via JSwarm.
1. `JENKINS_MASTER_URL`
The URL belonging of the Jenkins master.
2. `JENKINS_SLAVE_USERNAME`
Username or key ID that will be used to connect the slave.
3. `JENKINS_SLAVE_PASSWORD`
Password or key that will be used to connect the slave.
4. `JSWARM_EXTRA_ARGS`
In the case of running Jenkins in an OpenShift cluster, you'll first want to expose the JNLP port by creating a route object for the JNLP service. From there, this should be set to '-tunnel routeURL'.

### OpenShift Service Account
The OpenShift service account used to run the provisioner container image needs to have permission to run priveleged containers. In a full install, the Jenkins service account is given this elevated privileges. The step that must be done beyond this in Jenkins is to ensure that the OpenShift oauth token being used to connect to the OpenShift cluster is the Jenkins service account token. This is output to the console as the last step in the full installation process.
