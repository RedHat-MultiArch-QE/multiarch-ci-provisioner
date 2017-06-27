/**
 * Jenkinsfile
 *
 * Jenkins Pipeline to build and manage Atomic OpenShift
 */
pipeline {
    agent any
    node {
        ansiColor('xterm') {
            timestamps {
                try {
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
                                // Provision
                                sh 'linchpin -vvv up'

                                try {
                                    // TODO Kickoff tests
                                }

                                // Deprovision
                                finally {
                                    // Return any provisioned environments
                                    sh 'linchpin destroy'
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
                } catch (e) {
                    // If any exception occurs, mark the build as failed
                    currentBuild.result = 'FAILURE'
                    throw e
                } finally {
                    currentBuild.displayName = "Build #: ${env.BUILD_NUMBER}"
                    currentBuild.description = "${currentBuild.result}"
                    artifactArchiver(allowEmptyArchive: true, artifacts: '**/logs/**,*.txt,*.groovy,**/job.*,**/inventory.*', excludes: '**/*.example', fingerprint: true)
                }
            }
        }
    }
}