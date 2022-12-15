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
        stage('Docker push') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'staging') {
                         bat 'docker tag nnthinh/springboot-demo:latest 0f0f0f0f/springboot-demo:latest '
                         bat 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
                         bat 'docker push 0f0f0f0f/springboot-demo:latest '
                    }
                }
            }
        }
    }
}