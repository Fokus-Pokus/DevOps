pipeline {
    agent any

    stages {
        stage('Delete workspace before build starts') {
            steps {
                echo 'Deleting workspace'
                deleteDir()
            }
        }
        stage('Checkout') {
            steps{
                git branch: 'master',
                    url: 'https://github.com/Fokus-Pokus/DevOps.git'
                }
        }
        stage('Build docker image') {
            steps{
                sh 'docker build -t dev_ops_image .'

            }
        }
        stage('Build docker container') {
            steps{
                sh 'docker run --rm dev_ops_image .'

            }
        }
        stage('Push docker image to DockerHub') {
            steps{
                sh 'docker tag dev_ops_image linad/dev_ops_image'
                withDockerRegistry(credentialsId: 'dockerhub-dev-ops', url: 'https://index.docker.io/v1/') {
                    sh '''
                        docker push linad/dev_ops_image
                    '''
                }
            }
        }
        stage('Delete docker image locally') {
            steps{
                sh 'docker rmi linad/dev_ops_image'

                sh 'docker rmi dev_ops_image'
            }
        }

    }
}
