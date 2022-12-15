pipeline {
    agent any
    environment {
    		DOCKERHUB_CREDENTIALS=credentials('dockerHub')
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
                bat 'docker build -t nnthinh/springboot-demo:latest .'
                echo "Build Successfully!"
            }
        }
        stage('Login') {
            steps {
                bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Docker push') {
            steps {
                bat 'docker push nnthinh/springboot-demo:latest'
            }
        }
    }
    post {
    	always {
    		bat 'docker logout'
    	}
    }
}