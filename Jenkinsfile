stage('Build Docker Image') {
    environment {
        DOCKER_API_VERSION = '1.41'   // Prevent Windows Docker API mismatch
    }
    steps {
        bat '''
echo Building Docker Image...
docker build -t %IMAGE_NAME% .
'''
    }
}
