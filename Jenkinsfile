pipeline {
    agent any
    options {
        ansiColor('xterm')
    }
    
    environment {
        IMAGE_NAME = 'liortal26/flask-build-pipeline'
        TAG = 'latest'
    }
    stages {
        stage('Build Image') {
            agent {
                dockerfile {
                    filename 'Dockerfile'
                }
            }
            steps {
                script {
                    echo 'Built image from Dockerfile using dockerfile agent.'
                    echo 'echo -e "\033[0;32mHello colorful world!\033[0m"'
                }
            }
        }
        stage('test-snyk') {
            steps {
                snykSecurity(
                    snykInstallation: 'snyk-image',
                    snykTokenId: 'liortal26-snyk',
                    additionalArguments: '--docker liortal26/flask-build-pipeline:latest --all-projects --all-sub-projects'
                )
            }
        }
        stage('Push Image') {
            steps {
                script {
                    echo 'Tagging and pushing image to Docker Hub...'
                    sh "docker tag ${IMAGE_NAME}:${TAG} ${IMAGE_NAME}:${TAG}"
                    withCredentials([string(credentialsId: 'docker-token', variable: 'DOCKER_TOKEN')]) {
                        sh 'echo $DOCKER_TOKEN | docker login -u liortal26 --password-stdin'
                        sh "docker push ${IMAGE_NAME}:${TAG}"
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    post {
        failure {
            echo 'Pipeline failed. Sending notification...'
        }
    }
}