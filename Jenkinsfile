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

             stage('Scan') {
              steps {
                withSonarQubeEnv(installationName: 'lucario') {
                  sh './mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar'
                }
              }
            }

        stage('testando aplicacao'){
            steps{
                sh 'cmod +x testapp.sh'
                sh './testapp.sh'
            }
        }
    }
}

