pipeline {
    agent any

    // Removed global ansiColor option as it should be used in specific stages
    
    stages {
        stage('Build Image') {
            // This stage builds an image using the Dockerfile in your repo.
            agent {
                dockerfile {
                    filename 'Dockerfile'
                    // Optionally add: reuseNode true
                }
            }
            steps {
                script {
                    echo 'Built image from Dockerfile using dockerfile agent.'
                    // You can run additional commands inside the container here if needed.
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    echo 'Tagging and pushing image to Docker Hub...'
                    // Tag the image. The image built by the dockerfile agent is usually tagged using the directory name.
                    // Make sure the tag ("flask-build-pipeline:latest") matches what was produced in your build stage.
                    sh 'docker tag flask-build-pipeline:latest liortal26/flask-build-pipeline:latest'
                    // Log in to Docker Hub and push using your credentials.
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-token') {
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
