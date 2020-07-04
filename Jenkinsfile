pipeline {
     environment {
        registry = "ultraviolentlight/deployment_nginx_kubernetes"
        registryCredential = 'dockerhub'
     }
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
                    img = docker.build(registry + ":${env.GIT_HASH}")
                }
            }
        }
        stage('Push Img') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                    img.push()
                    }
                }
            }
        }
        stage('Scan Img') {
            steps{
                aquaMicroscanner imageName: "ultraviolentlight/deployment_nginx_kubernetes:${env.GIT_HASH}", notCompliesCmd: 'exit 4', onDisallowed: 'fail', outputFormat: 'html'
            }
        }
        stage('Run Img') {
            steps {
                script {
			        sh 'docker run --name website -d -p 80:80 ultraviolentlight/deployment_nginx_kubernetes'
                }
            }
        }
        stage('Deploying to EKS') {
            steps {
                dir('kubernetes') {
                    withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
                            sh "aws eks --region us-west-2 update-kubeconfig --name capstone"
                            sh 'kubectl apply -f deploy-config-cluster.yaml'
                            sh "kubectl set image deployment.apps/capstoneproject capstoneproject=ultraviolentlight/deployment_nginx_kubernetes"
                        }
                    }
            }
        }
        stage("Cleaning Img") {
            steps {
                script {
                    sh "echo 'Cleaning Docker'"
                    sh "docker system prune"
                }
            }
        }        
    }
}