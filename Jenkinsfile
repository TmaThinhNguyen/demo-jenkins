node {
        stage('Clone Repo') {
                // for display purposes
                // Get some code from a Github repository
                git url: 'https://github.com/TmaThinhNguyen/demo-jenkins.git',
                credentialsId: 'springdeploy-user',
                branch: 'master'
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
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]){
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                   sh 'docker push nnthinh/springboot-demo: latest'
                }

            }

        }


}