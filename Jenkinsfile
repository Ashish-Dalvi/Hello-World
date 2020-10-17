pipeline {

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
    agent any

    tools {
        maven 'maven_3.6.3'
    }

    stages {
        stage('Code Compilation') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('QA Execution') {
            steps {
                sh 'mvn clean test'
            }
        }

        stage('Code Package') {
            steps {
                sh 'mvn clean package'
               // archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }

          stage('Build Docker Image') {
                   steps {
                        sh 'docker build -t helloworld .'
                   }
                 }
        stage('Upload Docker to DockerRegistry') {
           steps {
		      script {
			     withCredentials([string(credentialsId: 'dockerhubC', variable: 'dockerhubC')]){
                 sh 'docker login docker.io -u ashishdalvi -p ${dockerhubC}'
                 echo "Push Docker Image to DockerHub : In Progress"
                 sh 'docker tag 8f68f646c760  ashishdalvi/linuxacademy:latest'
				 sh 'docker push ashishdalvi/linuxacademy:latest'
				 echo "Push Docker Image to DockerHub : In Progress"
				 }
              }
            }
        }


            }
        }


