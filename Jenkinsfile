node{
    def WORKSPACE = "/var/lib/jenkins/workspace/springboot-deploy"
    def dockerImageTag = "springboot-deploy${env.BUILD_NUMBER}"

    try{
        stage('Clone Repo'){
                       // for display purposes
                       // Get some code from a Github repository
                       git url: 'https://github.com/TmaThinhNguyen/demo-jenkins.git',
                           credentialsId: 'springdeploy-user',
                           branch: 'master'
        }
        stage('Build docker'){
                       dockerImage = docker.build("springboot-deploy:${env.BUILD_NUMBER}")
        }
        stage('Build docker'){
                      echo "Docker Image Tag Name: ${dockerImage}"
                      sh "docker stop springboot-deploy || true && docker rm springboot-deploy || true"
                      sh "docker run --name springboot-deploy -d -p 8081:8080 springboot-deploy:${env.BUILD_NUMBER}"
        }

    }catch(e){
        throw e
    }
}