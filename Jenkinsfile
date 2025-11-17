pipeline {
    agent any

    environment {
        DOCKER_BUILDKIT = "0"
        IMAGE_NAME = "flask_student_app"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                bat """
                echo Building Docker Image...
                docker build -t %IMAGE_NAME% .
                """
            }
        }

        stage('Run Container') {
            steps {
                bat """
                echo Stopping old container (if running)...
                docker stop flask_app || echo Not running

                echo Removing old container...
                docker rm flask_app || echo Already removed

                echo Starting new container...
                docker run -d -p 5000:5000 --name flask_app %IMAGE_NAME%
                """
            }
        }

        stage('Test App') {
            steps {
                bat """
                curl http://localhost:5000
                """
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'app.py, Dockerfile, requirements.txt', fingerprint: true
            }
        }
    }

    post {
        success {
            echo "Build & Deployment Completed Successfully!"
        }
        failure {
            echo "Build Failed!"
        }
    }
}
