pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t flask_student_app .'
            }
        }

        stage('Run Container') {
            steps {
                bat 'docker run -d --name flask_student_container -p 5000:5000 flask_student_app'
            }
        }

        stage('Test Application') {
            steps {
                bat 'curl http://localhost:5000'
            }
        }
    }

    post {
        always {
            bat 'docker ps -a'
        }
        success {
            echo "Build Successful!"
        }
        failure {
            echo "Build Failed!"
        }
    }
}
