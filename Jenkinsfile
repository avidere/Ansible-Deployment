/* groovylint-disable LineLength */
/* groovylint-disable-next-line LineLength */
/* groovylint-disable CompileStatic, DuplicateStringLiteral, NestedBlockDepth, UnusedVariable, VariableName, VariableTypeRequired */
pipeline {
    agent any
    environment {
        def git_branch = 'feature'
        def git_url = 'https://github.com/avidere/Ansible-Deployment.git'

        def mvntest = 'mvn test '
        def mvnpackage = 'mvn clean install'
        VAULT_CREDS=  credentials("${VAULT_ID}")
        FILE = 'secret.txt'
    }
    stages {
        stage('Git Checkout') {
            steps {
                script {
                    git branch: "${git_branch}", url: "${git_url}"
                    echo 'Git Checkout Completed'
                }
            }
        } 
        /* groovylint-disable-next-line SpaceAfterClosingBrace */
        stage('Maven Build') {
            steps {
                sh "${env.mvnpackage}"
                echo 'Maven Build Completed'
            }
        }
        stage('Unit Testing') {
            steps {
                script {
                    sh "${env.mvntest}"
                    echo 'Unit Testing Completed'
                }
            }
        }
        stage('Deploy Application using Ansible'){
            steps{
                /* groovylint-disable-next-line DuplicateListLiteral */
                script{
                  sh "echo '${VAULT_CREDS_PSW}' > secret.txt"
                  sh "  ansible-playbook setup_tomcat.yaml  "
                  sh " ansible-playbook ansible_vault.yaml --check --vault-password-file secret.txt"
                }
            }
            post {
                always {
                    //check for secret.txt and remove if it exists
                    sh '''#!/bin/sh
                        if [ -f $FILE ] ; then
                        rm $FILE
                        fi
                    '''
                }
           }
         
        }
 
    }

}