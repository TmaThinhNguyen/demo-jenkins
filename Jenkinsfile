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
            steps {
                bat 'docker build -t springboot-demo:latest .'
                echo "Build Successfully!"
            }
        }
        stage('Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                        bat "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                        bat 'docker push springboot-demo:latest'
                }
                echo "Login Successfully!"
            }
        }

    }
}