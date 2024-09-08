pipeline{
  agent any
  stages{
    stage('Checkout'){
      steps{
        checkout scm
      }
    }
    stage('Test Code'){
      steps{
        sh "mvn clean test"
      }
    }
    stage('Build Code'){
      steps{
        sh "mvn clean package"
      }
    }
    stage('Build Docker image'){
      steps{
          scripts{
        sshagent(['docker']) {
          sh "docker ps"
          }
        }
      }
    }
  }
}
