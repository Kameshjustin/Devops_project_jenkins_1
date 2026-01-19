pipeline {
    agent any

    environment {
        IMAGE_NAME = "python-jenkins-app"
    }

    options {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr:'5'))
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "main",
                url: ''
            }
        }
    
        stage('Install Dependencies') {
            steps {
                sh '''
                  python3 -m venv venv . venv/bin/activate pip install -r requirements.txt
                '''
            }
        }

        stage('Unit Test') {
            steps {
                sh '''
                 . venv/bin/activate pytest tests/
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }

    }

    post {
        success {
            echo "CI/CD Pipeline executed successfully"
        }
        failure {
            echo "Pipeline failed"
        }
        always {
            cleanWs()
        }
    }
}