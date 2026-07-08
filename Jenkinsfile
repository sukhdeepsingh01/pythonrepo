pipeline {
    agent any
    
    environment {
        REGISTRY = "localhost:5000"
        IMAGE_NAME = "python-demo"
        IMAGE_TAG = "v1"
        FULL_IMAGE_NAME = "${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
    }
    
    stages {
        stage('Clone') {
            steps {
                echo "========== Stage 1: Cloning Repository =========="
                checkout scm
                echo "✓ Repository cloned successfully!"
                sh 'ls -la'
            }
        }
        
        stage('Build') {
            steps {
                echo "========== Stage 2: Building Docker Image =========="
                sh '''
                    echo "Building Docker image: ${FULL_IMAGE_NAME}"
                    docker build -t ${FULL_IMAGE_NAME} .
                    echo "✓ Docker image built successfully!"
                    docker images | grep ${IMAGE_NAME}
                '''
            }
        }
        
        stage('Push') {
            steps {
                echo "========== Stage 3: Pushing Docker Image to Registry =========="
                sh '''
                    echo "Pushing image to registry: ${REGISTRY}"
                    docker push ${FULL_IMAGE_NAME}
                    echo "✓ Docker image pushed successfully!"
                    echo "Image URL: ${FULL_IMAGE_NAME}"
                '''
            }
        }
    }
    
    post {
        always {
            echo "========== Pipeline Execution Summary =========="
            echo "Job: ${JOB_NAME}"
            echo "Build: ${BUILD_NUMBER}"
            echo "Status: ${BUILD_STATUS}"
        }
        success {
            echo "✓✓✓ Pipeline executed successfully! ✓✓✓"
            echo "Docker Image: ${FULL_IMAGE_NAME}"
            echo "Registry: ${REGISTRY}"
        }
        failure {
            echo "✗✗✗ Pipeline failed! ✗✗✗"
            echo "Check logs above for errors"
        }
    }
}

