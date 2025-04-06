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
                }
            }
        }
        stage('test-snyk') {
            steps {
                snykSecurity(
                    snykInstallation: 'snyk',
                    snykTokenId: 'liortal26-snyk',
                    additionalArguments: "--docker ${IMAGE_NAME}:${TAG} --all-projects --json"
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
        stage('Build-xtrem') {
            steps {
                echo "Hello colorful world!"
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
            // Add notification logic here (e.g., email or Slack)
        }
    }
}