pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
            script {
                echo 'Building Docker image...'
                sh 'docker build -t flask-build-pipeline .'
            }
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