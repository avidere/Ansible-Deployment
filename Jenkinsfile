pipeline{
  agent any
  stages{
    stage('Checkout'){
      
        checkout scm
      
    }
    stage('Build Code'){
      steps{
        sh "mvn clean test"
      }
    }
  }
}
