pipeline {
    agent any
    tools {
        maven 'Maven'
        jdk 'jdk'
    }
    triggers{
        githubPush()
    }
    stages {
        stage('Clean') {
            steps {
                sh 'mvn clean'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: '**/test-results/*.xml'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
         stage('Deploy') {
            steps {
               echo 'Deploying....'
            }
        }
        stage('docker-build-image') {
            steps {
                sh 'docker build -t mamadou173diouf/jenkins .'
            }
        }
        stage('docker-push-image') {
            steps {
                sh 'docker push mamadou173diouf/jenkins'
    }
}
        
    }
}
