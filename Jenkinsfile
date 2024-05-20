/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'rsiriganagari/static-site'
    }
    stages {
        stage('Prepare') {
            steps {
                script {
                    sh 'ls -la'  // List all files in the current directory
                    sh 'docker info'  // Print Docker system info to check accessibility
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // This stage will build the static-site docker image
                    sh "docker build -t ${env.DOCKER_IMAGE}:latest ."
                }
            }
        }
        stage('Docker Login, Tag and Push') {
            steps {
                script {
                // This stage is used to auth to docker hub
                    /* groovylint-disable-next-line LineLength, NestedBlockDepth */
                    withCredentials([usernamePassword(credentialsId: 'csye7125-docker-pat', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'

                        // Extract version from version file
                        VERSION = sh(
                            script: "grep -P -o '\\d+.\\d+.\\d+' VERSION",
                            returnStdout: true
                        ).trim()

                        // Tag the latest image with version
                        sh "docker tag ${DOCKER_IMAGE}:latest ${DOCKER_IMAGE}:$VERSION"
                        

                        // Push the latest image to docker hub
                        sh "docker push ${DOCKER_IMAGE}:latest"
                        sh "docker push ${DOCKER_IMAGE}:${VERSION}"
                    }
                }
            }
        }
    }
}
