pipeline {
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
                '''
            }
        }

        stage('Test') {
            steps {
                sh 'python -m unittest discover -s test'
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
                    credentialsId: 'pypi-credentials',
                    usernameVariable: 'TWINE_USERNAME',
                    passwordVariable: 'TWINE_PASSWORD'
                )]) {
                    sh 'python -m twine upload dist/* --non-interactive'
                }
            }
        }
    }
}