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

        stage('SonarQube analysis') {
            environment {
              SCANNER_HOME = tool 'lucario-scanner'
            }
            steps {
            withSonarQubeEnv(credentialsId: 'e9da566a-6fc8-45dc-9e24-3d41181d49a7', installationName: 'lucario') {
                 sh '''$SCANNER_HOME/bin/sonar-scanner \
                 -Dsonar.projectKey=lucario \
                 -Dsonar.projectName=projectName \
                 -Dsonar.sources=src/ \
                 -Dsonar.java.binaries=target/classes/ \
                 -Dsonar.exclusions=src/test/java/****/*.java \
                 -Dsonar.java.libraries=/var/lib/jenkins/.m2/**/*.jar \
                 -Dsonar.projectVersion=${BUILD_NUMBER}-${GIT_COMMIT_SHORT}'''
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

