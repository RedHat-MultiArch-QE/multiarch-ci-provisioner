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

node ('multiarch-aos-jenkins-slave') {
    ansiColor('xterm') {
        timestamps {

            stage('Trigger') {
                // TODO Set triggers for RPM build
            }

            stage('Build') {
                // TODO build an executable environment
                dir('ci-pipeline') {
                    git 'https://github.com/CentOS-PaaS-SIG/ci-pipeline'
                }
                
                // Info gathering
                sh 'cat ~/.beaker_client/config'

                // Parse the $CI_MESSAGE
            }

            stage('Test') {
                // TODO Install linchpin
                sh 'linchpin -vvv up'
                //    try {
                //        // Kick off tests
                //    }
                // Deprovision
                //    finally {
                // Return any provisioned environments
                sh 'linchpin destroy'
                //    }
            }

            // TODO implement publishing process
            stage('Deploy') {
                // TODO Deploy changes
            }
        }
    }
}
