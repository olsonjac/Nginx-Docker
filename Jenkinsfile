pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/olsonjac/Nginx-Docker'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t jolsoniot/nginx-nr:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push jolsoniot/nginx-nr:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}