pipeline {
    agent {
        label 'agent'
    }
    environment {
        DOCKER_TAG = "flask-${env.BUILD_NUMBER}"
    }
    stages {
        stage('build') {
            steps {
                sh "docker build -t abrar2510/flask-docker-app:${env.BUILD_NUMBER} ."
                withCredentials([usernamePassword(credentialsId: 'docker_hub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    sh "docker login -u $user -p $pass"
                    sh "docker push abrar2510/flask-docker-app:${env.BUILD_NUMBER}"
                }
            }
        }

        stage('deploy') {
            steps {
                script {
                    // Run Ansible playbook to deploy Flask app
                    sh "ansible-playbook -i inventory/hosts roles\flask_deploy\tasks\main.yml -e docker_tag=${env.DOCKER_TAG} -e build_number=${env.BUILD_NUMBER}"
                }
            }
        }
    }
}
