pipeline {

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
    agent any
    parameters{
        choice (name: 'version', choices: ['1.1.0','1.2.0','1.3.0' ], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }
    tools {
            //configure build tools like maven ,ant, gradle
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
        //this stage is executed when branch = master
            when{
                 expression {
                   env.BRANCH_NAME == 'master'
                }
          }
            steps {
                sh 'mvn clean package'
               // archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }

        //stage('Build Docker Image') {
         //  steps {
        //        sh 'docker build -t helloworld .'
        //   }
        // }
        stage('Shell') {
           steps {
                sh '/var/lib/jenkins/hello.sh'
           }
         }

   }
}