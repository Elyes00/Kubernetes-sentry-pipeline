# kubernetes-sentry
Welcome to SENTRY on KUbernetes.

Sentry provides self-hosted and cloud-based error monitoring that helps all software
teams discover, triage, and prioritize errors in real-time.
#
Requirements

Docker 17.05.0+

Compose 1.19.0+
#
This project aims to integrate the sentry plateform into kubernetes.
We have developed a docker-compose.yml file that has:
        -redis
        -postgres
        -memcached
        -sentry:
                a worker
                a cron
                a web app
                
We have also deployed many containers of those components and to deploy this plateform on kubernetes, we created diffrent pods 
and wervices that has the type: LoadBalancer for networking when we deploy hem on google cloud platefom.
#
Kubernetes on google cloud plateform
#
VOLUMES:
First, We create your volumes where you will store your postgres data as well as your sentry files.

STORAGE:
Sentry needs 3 processes for it to work: its web app, worker, and its own cron app. Good thing these 3 are provided in their docker image. They all share the same volume and they would have the same environment configurations.

POSTGRES, REDIS and MEMCACHED:
#
We now can create Postgres , Redis and Memcached pods via a deployment yaml file and then create their services.

#
On Kubernetes we have to generate a key via kub.sh file , then we have to store it via a yaml file secret.yml after we transform it into Base64 via transform.sh.
After that we have to upgrade the database via upgrade-base.sh and then retrieve our secret key then decode it.
#
Finally we create our sentry pods and services and deploy them on kubernetes.
#
JENKINS:

In order to automate our work we used pipeline concept using Jenkinsfile.
In order to use this file we must create a kubernates instance on AWS and provide then the DNS public (IPv4)
to ssh our instance (example ec2-3-95-32-58.compute-1.amazonaws.com that i have deployed).

#
Files:

The chagetag.sh file is made to modify the tag of the images, after that the yam file of the deployments for kubernetes will pull those images with new version (tags).
Kub.sh will generate a key that will be used for the sentry web app to be authenticated after decoding it and updating the base with upgrade-base.sh.
