pipeline{
    agent{
        label 'agent'
    }
    stages{
        stage('build'){
            steps{
            sh "docker build -t maro4299311/flask:${env.BUILD_NUMBER} ."
            withCredentials([usernamePassword(credentialsId: 'docker_hub', passwordVariable: 'pass', usernameVariable: 'user')]) {
             sh "docker login -u $user  -p $pass"
             sh "docker push maro4299311/flask:${env.BUILD_NUMBER}"
                //dasdasdsads
}
            }
       
           
        }

        stage('deploy'){
            steps{
                sh "docker run -d -p 500${env.BUILD_NUMBER}:8080 maro4299311/flask:${env.BUILD_NUMBER}"
            }
        }
    }
}
