pipeline{
    agent any
    stages{
        stage('build do compose'){
            steps{
                sh 'docker-compose up --build -d'
            }
        }
        stage('sleep para subida de containers'){
            steps{
                sh 'sleep 10'
            }
        }
        node {
          stage('SCM') {
            checkout scm
          }
          stage('SonarQube Analysis') {
            def scannerHome = tool 'SonarScanner';
            withSonarQubeEnv() {
              sh "${scannerHome}/bin/sonar-scanner"
            }
          }
        }

        stage('testando aplicacao'){
            steps{
                sh 'chmod +x testapp.sh'
                sh './testapp.sh'
            }
        }
    }
}

