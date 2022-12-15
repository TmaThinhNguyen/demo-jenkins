pipeline {

    agent none stages {

        stage('Clone Repo') {
                // for display purposes
                // Get some code from a Github repository
                git url: 'https://github.com/TmaThinhNguyen/demo-jenkins.git',
                credentialsId: 'springdeploy-user',
                branch: 'master'
        }
        stage('Maven Install') {
                agent {
                    docker {
                        image 'maven 3.6.0'
                    }
                }
                steps {
                    sh 'mvn clean install'
                }
        }
        stage('Docker Build') {
                agent any
                steps{
                    sh 'docker build -t nnthinh/springboot-demo:latest .'
                }
        }
        stage('Docker push') {
            agent any
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'thewizard999', usernameVariable: '0f0f0f0f')]){
                    sh "docker login -u ${env.0f0f0f0f} -p ${env.thewizard999}"
                   sh 'docker push nnthinh/springboot-demo: latest'
                }

            }

        }

    }

}