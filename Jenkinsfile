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
             script{
                scannerHome = tool 'lucario_scanner';
             }
             withSonarQubeEnv('lucario'){
                sh "/opt/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=lucario -Dsonar.sources=. -Dsonar.host.url=http://127.0.0.1:9000 -Dsonar.login=7b275f4954a4e414807fd74379f6f9b8edb8176f1"
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

