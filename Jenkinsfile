pipeline {
    agent any
    environment {
    		registry = "0f0f0f0f/nnthinh"
    		registryCredential = 'dockerhub'
    		dockerImage = ''
    	}
    stages {
        stage('Clone') {
            steps {
                git url: 'https://github.com/TmaThinhNguyen/demo-jenkins.git',
                    credentialsId: 'springdeploy-user',
                    branch: 'master'
                echo "Clone successfully!"
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Login') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps {
                bat "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}