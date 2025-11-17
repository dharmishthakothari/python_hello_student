pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Setup Python Environment') {
            steps {
                bat """
                echo Creating virtual environment...
                python -m venv venv

                echo Activating environment...
                call venv\\Scripts\\activate

                echo Installing dependencies...
                pip install -r requirements.txt
                """
            }
        }

        stage('Run Flask App') {
            steps {
                bat """
                call venv\\Scripts\\activate
                echo Running Flask app...
                python app.py
                """
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'app.py, requirements.txt', fingerprint: true
            }
        }

    }

    post {
        success {
            echo "Jenkins build completed successfully!"
        }
        failure {
            echo "Build failed!"
        }
    }
}
