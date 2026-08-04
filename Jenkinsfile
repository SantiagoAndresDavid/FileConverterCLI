pipeline {
    agent any

    stages {

        stage('Setup') {
            steps {
                sh '''
                python3 --version
                python3 -m pip install --upgrade pip
                python3 -m pip install build twine
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                if [ -f requirements.txt ]; then
                    python3 -m pip install -r requirements.txt
                fi
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                python3 -m unittest discover -s test
                '''
            }
        }

        stage('Build Package') {
            steps {
                sh '''
                python3 -m build
                '''
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'dist/*', fingerprint: true
            }
        }

        stage('Publish to PyPI') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'pypi-credentials',
                    usernameVariable: 'TWINE_USERNAME',
                    passwordVariable: 'TWINE_PASSWORD'
                )]) {
                    sh '''
                    python3 -m twine upload dist/* --non-interactive
                    '''
                }
            }
        }
    }

    post {

        success {
            echo "✅ Pipeline completo"
        }

        failure {
            echo "❌ Pipeline falló - limpiando"
            sh '''
            rm -rf dist build *.egg-info
            '''
        }

        always {
            cleanWs()
        }
    }
}