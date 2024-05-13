def buildNumberText() {
    return "1.0.0"
}
pipeline {
    agent any

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
                sh "docker build --force-rm -t 'lets/minikube-rest-api' ./minikube-rest-api"
            }
        }

		stage('Kube Deploy') {
            steps {
                script {
                        sh "chmod a+x /opt/homebrew/bin/kubectl"
                        echo 'kubectl'
                        sh "sed -i 's/tag/" +  buildNumberText() + "/g' ./k8s/deployment.yml"
                        sh "/opt/homebrew/bin/kubectl apply -f ./k8s/"
                }
            }
		}
      }

  	post {
        success {
          script {
            echo 'docker ps'
            sh "docker ps"
          }
        }
  	}
}