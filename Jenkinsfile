pipeline     {
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
        stage('Maven Build') {
                steps {
                     bat 'mvn -B -DskipTests clean package'
                }
        }
        stage('Docker Build') {
            steps {
                bat 'docker build -t 0f0f0f0f/springboot:latest .'
                echo "Build Successfully!"
            }
        }
        stage('Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                        bat "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                        bat 'docker push 0f0f0f0f/springboot:latest'
                }
                echo "Login Successfully!"
            }
        }
        stage('SSH EC2') {
            steps{
                sshagent(credentials: ['SSH-EC2']){
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                        bat "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                        bat "ssh -o StrictHostKeyChecking=no -l ec2-user 52.90.112.87 docker pull 0f0f0f0f/springboot:latest"
                    }
                    echo "ssh Successfully!"
            }
    }
}