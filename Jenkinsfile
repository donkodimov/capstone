pipeline {
     agent any
     stages {
         stage('AWS Credentials') {
             steps {
               withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-static', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
               sh '''  
                   mkdir -p ~/.aws
                   echo "[default]" >~/.aws/credentials
                   echo "[default]" >~/.boto
                   echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>~/.boto
                   echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}">>~/.boto
                   echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>~/.aws/credentials
                   echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}">>~/.aws/credentials
               '''
                }
            }
         }
         stage('Lint') {
      steps {
        sh 'make lint'
      }
    }
    stage('Build Docker') {
      steps {
        sh 'make build'
      }
    }
    stage('Login to dockerhub') {
      steps {
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
          sh 'docker login -u donko -p ${dockerhubpwd}'
        }
      }
    }
    stage('Upload Image') {
      steps {
        sh 'make upload'
      }
    }
         stage('Deploy to Kubernetes') {
              steps {
                  ansiblePlaybook playbook: 'main.yml', inventory: 'inventory', credentialsId: 'pipeline'
              }
         }
         
     }
}
