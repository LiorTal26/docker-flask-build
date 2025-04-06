pipeline {
    agent any

    options {
        ansiColor('xterm')
    }
    credentialsId 'docker-token'
    stages {
        // stage('Build') {
        //     steps {
        //     script {
        //         echo 'Building Docker image...'
        //         sh 'docker build -t flask-build-pipeline .'
        //     }
        //     }
        //     withCredentials([string(credentialsId: 'docker-token', variable: 'DOCKER_TOKEN')]) {
        //         echo "Using Docker Hub token: ${DOCKER_TOKEN}"
        //     }
        // }
        agent {
            dockerfile {
                filename 'Dockerfile'
            }
            dockerhub {
                credentialsId 'docker-token'
                image 'liortal26/flask-build-pipeline:latest'
            }
        }
        stage('Build-xtrem') {
            steps {
                echo '\033[34mHello\033[0m \033[33mcolorful\033[0m \033[35mworld!\033[0m'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
