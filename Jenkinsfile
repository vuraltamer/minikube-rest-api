def buildNumberText() {
    return "1.0.0"
}

pipeline {
    agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('lets5054')
	}
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/vuraltamer/minikube-rest-api.git'
                echo 'Clone Repository'
            }
        }
        stage('Build') {
            steps {
                sh './gradlew build' // Spring Boot projesini Gradle ile derliyoruz
                 echo 'Build'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test' // Testleri çalıştırıyoruz
                echo 'Test'
            }
        }
        stage('Package') {
            steps {
                sh './gradlew bootJar' // Spring Boot uygulamasını JAR dosyasına paketliyoruz
                echo 'Package'
            }
        }
    }
    post {
        success {
            echo 'Proje başarıyla derlendi, test edildi ve paketlendi!'
        }
        failure {
            echo 'Proje derleme, test veya paketleme aşamasında başarısız oldu.'
        }
    }
}