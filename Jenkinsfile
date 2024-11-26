pipeline{
    agent{
        label 'agent'
    }
    stages{
        stage('build'){
            steps{
            sh "docker build -t abrar2510/flask-docker-app:${env.BUILD_NUMBER} ."
            withCredentials([usernamePassword(credentialsId: 'docker_hub', passwordVariable: 'pass', usernameVariable: 'user')]) {
             sh "docker login -u $user  -p $pass"
             sh "docker push abrar2510/flask-docker-app:${env.BUILD_NUMBER}"
                //dasdasdsads
}
            }
       
           
        }

        stage('deploy'){
            steps{
                sh "docker run -d -p 500${env.BUILD_NUMBER}:8080 abrar2510/flask-docker-app:${env.BUILD_NUMBER}"
            }
        }
    }
}
