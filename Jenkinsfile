pipeline {
 agent any

    stages {
        stage ('Get git repo') {
            steps {
                git 'https://github.com/v-kamerdinerov/devops_final_hw.git'
            }
        }

        stage ('Terraform planing') {
            steps {
                withAWS(credentials: 'awscli', region: 'us-east-2') {
                sh 'terraform init'
                sh 'terraform plan -out aws.tfout '
                sh 'terraform apply aws.tfout'
            }
            }
        }
        }
        }

