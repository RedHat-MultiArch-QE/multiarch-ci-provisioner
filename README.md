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
3. Copy Artifact Plugin

### OpenShift Service Account
The OpenShift service account used to run the provisioner container image needs to have permission to run priveledged containers. In a full install, the Jenkins service account is given this elevated privileges. The step that must be done beyond this in Jenkins is to ensure that the OpenShift oauth token being used to connect to the OpenShift cluster is the Jenkins service account token. This is output to the console as the last step in the full installation process.
