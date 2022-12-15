pipeline {
    agent any
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
            steps{
                bat 'docker build -t nnthinh/springboot-demo:latest .'
                echo "Build Successfully!"
            }
        }
    }
}