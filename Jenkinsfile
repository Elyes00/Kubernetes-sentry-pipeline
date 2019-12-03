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
        stage ("build docker images for postgres"){
            steps{
                sh "docker build . -t elyes000/postgres:${DOCKER_TAG} -f ./containers/postgres/Dockerfile "
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
                    sh "docker push elyes000/postgres:${DOCKER_TAG}"
                    
                }
            }
        }
      
        //ec2-user is our vm on AWS after deploying kubernetes
         stage('Deploy to kubernetes'){
            steps{
                sh "chmod +x changetag.sh"
                sh "./changetag.sh ${DOCKER_TAG}"
                sshagent(['my host']) {
                    sh "scp -o StrictHostKeyChecking=no postgres-volume.yml sentry-volume.yml kub.sh transform.sh upgrade-base.sh decode.sh secret.yml  nginx-service.yml nginx.yml redis-service.yml redis.yml memcached.yml memcached-service.yml postgres-volume.yml postgres-service.yml postgres.yml 
                    sentry-volume.yml sentry-service.yml sentry-web-service.yml sentry-web.yml sentry-worker.yml sentry-cron.yml 'ec2-user@xxx:/home/ec2-user/' "
                    script{
                        try{
                            sh "ssh ec2-user@xxx kubectl apply -f ."
                        }catch(error){
                            sh "ssh ec2-user@xxx kubectl create -f ."
                        }
                    }
                }
            }
        }


}

def getDockerTag(){
    def tag  = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
}
