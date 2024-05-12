def buildNumberText() {
    return "1.0.0"
}

pipeline {
    agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('lets5054')
	}
    stages {

        stage('Package Application') {
            steps {
                echo 'Packaging the app into jars with gradle'
                sh "./gradlew build"

            }
        }
    }

  	post {
  		always {
  		    sh "docker image prune -af"
            sh "docker builder prune -af"
  		}
  	}
}