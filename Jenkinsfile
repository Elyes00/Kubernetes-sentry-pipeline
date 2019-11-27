pipeline {
    environment{
        DOCKER_TAG = getDockerTag()
    }
    agent any
    stages{

        stage ("build docker images for memcached "){
            steps{
                sh "docker build . -f elyes000/memcached:${DOCKER_TAG} -f ./containers/memcached/Dockerfile "
            }

      }
        
        stage ("build docker images for nginx"){
            steps{
                sh "docker build . -t elyes000/nginx:${DOCKER_TAG} -f ./containers/nginx/Dockerfile "
            }

      }
        stage ("build docker images for sentry"){
            steps{
                sh "docker build . -t elyes000/sentry:${DOCKER_TAG} -f ./containers/sentry/Dockerfile "
            } 

    }
       
        stage('DockerHub Push'){
            steps{
                // -p pssword for my docker hub :xxx
                withCredentials([string(credentialsId: 'dockerhub')]) {
                    sh "docker login -u elyes00 -p xxx"
                    sh "docker push elyes000/nginx:${DOCKER_TAG}"
                    sh "docker push elyes000/memcached:${DOCKER_TAG}"
                    sh "docker push elyes000/sentry:${DOCKER_TAG}"
                }
            }
        }



}

def getDockerTag(){
    def tag  = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
}