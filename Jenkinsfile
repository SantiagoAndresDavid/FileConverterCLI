pipeline {
    //cuando usas un agente docker el mismo se limpia despues de finalizar el proceso 
    agent {
        docker {
            image 'python:3.12-slim'
        }
    }

    stages {

        stage('Setup') {
            steps {
                sh '''
                python --version
                python -m pip install --upgrade pip
                python -m pip install build twine
                # Install runtime and test dependencies
                if [ -f requirements.txt ]; then
                    python -m pip install -r requirements.txt
                fi
                '''
            }
        }

        stage('Test') {
            steps {
                // Prefer pytest for discover and better output
                sh 'python -m pytest -q'
            }
        }

        stage('Build') {
            steps {
                sh 'python -m build'
            }
        }

        stage('Publish') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'pypi',
                    usernameVariable: 'TWINE_USERNAME',
                    passwordVariable: 'TWINE_PASSWORD'
                )]) {
                    sh 'python -m twine upload dist/* --non-interactive'
                }
            }
        }
    }
}