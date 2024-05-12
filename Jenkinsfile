pipeline {
    agent any

    environment {
        GRADLE_HOME = tool 'Gradle'
        PATH = "$PATH:$GRADLE_HOME/bin"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/vuraltamer/minikube-rest-api.git'
            }
        }
        stage('Build') {
            steps {
                sh './gradlew build' // Spring Boot projesini Gradle ile derliyoruz
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test' // Testleri çalıştırıyoruz
            }
        }
        stage('Package') {
            steps {
                sh './gradlew bootJar' // Spring Boot uygulamasını JAR dosyasına paketliyoruz
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