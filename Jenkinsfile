pipeline {
 agent any

    stages {
        stage ('Get git repo') {
            steps {
                git 'https://github.com/v-kamerdinerov/devops_final_hw.git'
            }
        }

        stage ('Terraform deploy AWS instances') {
            steps {
                withAWS(credentials: 'awscli', region: 'us-east-2') {
                sh 'terraform init'
                sh 'terraform plan -out aws.tfout '
                sh 'terraform apply aws.tfout'
            }
            }
        }
        stage ('Ansible deploy build and prod stage') {
            steps {
            withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')])
            {
            ansiblePlaybook becomeUser: 'ubuntu', credentialsId: 'amazon', disableHostKeyChecking: true, installation: 'ansible', inventory: 'hosts', playbook: 'build.yml'
            ansiblePlaybook becomeUser: 'ubuntu', credentialsId: 'amazon', disableHostKeyChecking: true, installation: 'ansible', inventory: 'hosts', playbook: 'prod.yml'
            }
            }
        }
        }
}
