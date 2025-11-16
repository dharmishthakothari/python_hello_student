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
                sh 'docker build -t flask_student_app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d --name flask_student_container -p 5000:5000 flask_student_app'
            }
        }

        stage('Test Application') {
            steps {
                sh 'sleep 5'  // wait for container to start
                sh 'curl http://localhost:5000'
            }
        }
    }

    post {
        always {
            sh 'docker ps -a'
        }
        success {
            echo "Build Successful!"
        }
        failure {
            echo "Build Failed!"
        }
    }
}
