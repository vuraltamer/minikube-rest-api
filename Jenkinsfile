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
		stage('Build') {
		    when {
                anyOf {
                    branch 'stb'
                    branch 'prod'
                }
            }

            steps {
                echo 'Building image'
                sh "docker build --force-rm -t 'lets/minikube-rest-api:" + buildNumberText()  + "' ./minikube-rest-api"

            }
        }

		stage('Kube Deploy') {
            steps {
                script {
                        sh "chmod a+x kubectl"
                        echo 'kubectl'
                        sh "sed -i 's/tag/" +  buildNumberText() + "/g' ./k8s/deployment.yml"
                        sh "/usr/local/bin/kubectl apply -f ./k8s/"
                }
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
