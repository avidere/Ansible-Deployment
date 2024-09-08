pipeline{
  agent any
  stages{
    stage('Checkout'){
      steps{
        checkout scm
      }
    }
    stage('Build Code'){
      steps{
        sh "mvn clean test"
      }
    }
  }
}
