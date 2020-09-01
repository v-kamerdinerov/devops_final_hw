pipeline {
 agent any

    stages {
        stage ('Get git repo') {
            steps {
                git 'https://github.com/v-kamerdinerov/devops_final_hw.git'
            }
        }

        stage ('Terraform planning') {
            steps {
                withAWS(credentials: 'awscli', region: 'us-east-2') {
                sh 'terraform init'
                sh 'terraform plan -out aws.tfout '
                sh 'terraform apply aws.tfout'
            }
            }
        }
        stage ('Ansible planning')
            steps {
            withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
            ansiblePlaybook becomeUser: 'ubuntu', credentialsId: 'amazon', disableHostKeyChecking: true, inventory: '????', playbook: 'build.yml'
            ansiblePlaybook becomeUser: 'ubuntu', credentialsId: 'amazon', disableHostKeyChecking: true, inventory: '????', playbook: 'prod.yml'
            }
            }


        }
        }

