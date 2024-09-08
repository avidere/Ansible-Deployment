pipeline{
  agent any
  stages{
    stage('Checkout'){
      script{
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
