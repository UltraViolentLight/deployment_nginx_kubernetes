pipeline {
     agent any
     stages {    
        stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e website/*.html'
              }
         } 
        stage('Build Img') {
            steps {
                script {
                    img = docker.build("ultraviolentlight/deployment_nginx_kubernetes")
                }
            }
        }
        stage('Push Img') {
            steps {
                script {
                    docker.withRegistry('', dockerhubCredentials) {
                    img.push()
                    }
                }
            }
        }
        stage('Run Img') {
            steps {
                script {
			        sh 'docker run --name website -d -p 80:80 ultraviolentlight/deployment_nginx_kubernetes'
                }
            }
        }
    }
}