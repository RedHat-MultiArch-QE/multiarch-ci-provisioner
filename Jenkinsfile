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
                // TODO Set triggers for Job Build
            }

            stage('Provision') {
                // TODO build an executable environment
                dir('ci-pipeline') {
                    git 'https://github.com/jaypoulz/multiarch-ci-pipeline'
                }

                // Parse the $CI_MESSAGE
            }

            stage('Test') {
                dir('ci-pipeline') {
                    sh 'cinchpin up'
                    //    try {
                    //        // Kick off tests
                    //    }
                    // Deprovision
                    //    finally {
                    // Return any provisioned environments
                    // sh 'cinchpin destroy'
                    //    }
                }
            }

            // TODO implement publishing process
            stage('Kickoff Test') {
                // TODO Kickoff Test
            }
        }
    }
}
