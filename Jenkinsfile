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
        stage('test-snyk'){
            steps {
                script {
                    echo 'Running Snyk test...'
                    withCredentials([string(credentialsId: 'liortal26-snyk', variable: 'SNYK_TOKEN')]) {
                        sh 'snyk test --docker flask-build-pipeline:latest --all-projects --json-file-output=snyk-report.json'
                    }
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
                wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']) {
                    echo "\033[34mHello\033[0m \033[33mcolorful\033[0m \033[35mworld!\033[0m"
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