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
                sh "/opt/sonar-scanner/bin/sonar-scanner -X -Dsonar.projectKey=lucario -Dsonar.sources=. -Dsonar.host.url=http://127.0.0.1:9000 -Dsonar.login=a0b2c8211cfaec9c4234160dae01e989ca5efcc1"
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

