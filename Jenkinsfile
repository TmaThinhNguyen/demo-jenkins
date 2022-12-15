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
                bat 'docker build -t nnthinh/springboot-demo:latest .'
                echo "Build Successfully!"
            }
        }
        stage('Docker push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]){
                    bat 'docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}'
                    bat 'docker push nnthinh/springboot-demo: latest'
                    echo "push Successfully!"
                    bat 'docker stop nnthinh/springboot-demo || true && docker rm nnthinh/springboot-demo || true'
                    bat 'docker run --name nnthinh/springboot-demo -d -p 8081:8081 nnthinh/springboot-demo:latest'
                    echo "application run Successfully!"
                }
            }
        }
    }
}