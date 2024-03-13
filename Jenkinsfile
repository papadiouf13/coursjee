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
         stage('Ansible Deploy') {
            steps {
                sh "ansible-playbook main.yml -u machine"
            }
        }
    }
}
