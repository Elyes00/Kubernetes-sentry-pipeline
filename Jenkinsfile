pipeline {

    agent any
    stages{

        stage ("build docker images for memcached "){
            steps{
                sh "docker build -f elyes000/memcached:v1 -f ./containers/memcached/Dockerfile ."
            }

      }
        
        stage ("build docker images for nginx"){
            steps{
                sh "docker build -t elyes000/nginx:v1 -f ./containers/nginx/Dockerfile ."
            }

      }
        stage ("build docker images for sentry"){
            steps{
                sh "docker build -t elyes000/sentry:v1 -f ./containers/sentry/Dockerfile ."
            } 

    }
       




}