pipeline{
    agent any
    stage{
        stages('Ashwini Git Checkout step'){
            steps{
                git branch: 'main', url: 'https://github.com/avidere/Ansible-Deployment.git'
            }
        }
    }
}