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
pipeline {
    agent: any

    options: {
        ansiColor('xterm')
        timestamps
    }

    stages {
        stage('Trigger') {
            steps {
                // TODO Set triggers for RPM build
            }
        }

        stage('Build') {
            steps {
                // TODO build an executable environment
                dir('ci-pipeline') {
                    git 'https://github.com/CentOS-PaaS-SIG/ci-pipeline'
                }

                // Parse the $CI_MESSAGE
            }
        }

        stage('Test') {
            steps {
                sh 'linchpin -vvv up'
                script {

                    try {
                        // Kick off tests
                    }
                    // Deprovision
                    finally {
                        // Return any provisioned environments
                        sh 'linchpin destroy'
                    }
                }
            }
        }

        // TODO implement publishing process
        stage('Deploy') {
            steps {
                // TODO Deploy changes
            }
        }
    }
}
