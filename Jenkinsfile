/**
 * Jenkinsfile
 *
 * Jenkins Pipeline to build and manage Atomic OpenShift
 */

//try {
//} catch (e) {
//    // If any exception occurs, mark the build as failed
//    currentBuild.result = 'FAILURE'
//    throw e
//} finally {
//    currentBuild.displayName = "Build #: ${env.BUILD_NUMBER}"
//    currentBuild.description = "${currentBuild.result}"
//    archiveArtifacts(allowEmptyArchive: true, artifacts: '**/logs/**,*.txt,*.groovy,**/job.*,**/inventory.*', excludes: '**/*.example', fingerprint: true)
//}

node ('jenkins-slave') {
    ansiColor('xterm') {
        timestamps {

            stage('Trigger') {
                // TODO Set triggers for RPM build
            }

            stage('Build') {
                // TODO build an executable environment
                dir('ci-pipeline') {
                    git 'https://github.com/jaypoulz/multiarch-aos-ci-pipeline'
                }
                
                // Info gathering
                //sh 'cat /etc/beaker/client.conf'
                //sh 'cat /etc/jenkins.keytab-multiarch-qe-aos-jenkins.rhev-ci-vms.eng.rdu2.redhat.com'

                // Parse the $CI_MESSAGE
            }

            stage('Test') {
                dir('ci-pipeline') {
                    // TODO Install linchpin
                    sh 'cinchpin up'
                    //    try {
                    //        // Kick off tests
                    //    }
                    // Deprovision
                    //    finally {
                    // Return any provisioned environments
                    sh 'cinchpin destroy'
                    //    }
                }
            }

            // TODO implement publishing process
            stage('Deploy') {
                // TODO Deploy changes
            }
        }
    }
}
