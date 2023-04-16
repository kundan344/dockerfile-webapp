pipeline {
    agent { label 'dev-node' }

    stages {
        stage('source code pull') {
            steps {
                git 'https://github.com/kundan344/dockerfile-webapp.git'
            }
        }
    stage('docker image build') {
            steps {
                sh 'docker build . -t $JOB_NAME:v1.$BUILD_ID'
                sh 'docker image tag $JOB_NAME:v1.$BUILD_ID kundankumar344/$JOB_NAME:v1.$BUILD_ID'
                sh 'docker image tag $JOB_NAME:v1.$BUILD_ID kundankumar344/$JOB_NAME:latest'
            }
        }
    stage('docker image push in docker hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'dockerhubpassword')]) {
    // some block
            sh 'docker login -u kundankumar344 -p ${dockerhubpassword}'
            sh 'docker push kundankumar344/$JOB_NAME:v1.$BUILD_ID'
            sh 'docker push kundankumar344/$JOB_NAME:latest' 
            sh 'docker rmi -f $JOB_NAME:v1.$BUILD_ID kundankumar344/$JOB_NAME:v1.$BUILD_ID kundankumar344/$JOB_NAME:latest '
}
            }
        }
    stage('docker image deployement') {
            steps {
                sh 'docker rm -f con1'
                sh 'docker rmi -f kundankumar344/new-project:latest'
                sh 'docker run -itd --name con1 -p 80:80 kundankumar344/new-project:latest'
            }
        }    
        
    
}
}
