pipeline {
    agent any
    environment {
    		dockerhub=credentials('dockerhub')
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
                bat 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
                echo "Push Successfully!"
            }
        }
    }
}