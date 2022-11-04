pipeline{
    agent any
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
    stage('testando aplicacao'){
        steps{
            sh 'testapp.sh'
        }
    }
}

