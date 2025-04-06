pipeline {
    agent any
    
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
        stage('Push Image') {
            steps {
                script {
                    echo 'Tagging and pushing image to Docker Hub...'
                    sh 'docker tag flask-build-pipeline:latest liortal26/flask-build-pipeline:latest'
                    withCredentials([string(credentialsId: 'docker-token', variable: 'DOCKER_TOKEN')]) {
                        sh 'echo $DOCKER_TOKEN | docker login -u liortal26 --password-stdin'
                        sh 'docker push liortal26/flask-build-pipeline:latest'
                    }
                }
            }
        }
        stage('Build-xtrem') {
            steps {
                ansiColor('xterm') {
                    echo '\033[34mHello\033[0m \033[33mcolorful\033[0m \033[35mworld!\033[0m'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}