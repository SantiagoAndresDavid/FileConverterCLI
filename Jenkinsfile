pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/SantiagoAndresDavid/FileConverterCLI.git'
            }
        }

        stage('Setup') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate

                pip install --upgrade pip
                pip install build twine
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                if [ -f requirements.txt ]; then
                    pip3 install -r requirements.txt
                fi
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                if [ -d tests ]; then
                    python3 -m unittest discover -s tests
                else
                    echo "No tests found"
                fi
                '''
            }
        }

        stage('Build Package') {
            steps {
                sh 'python3 -m build'
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
            echo "✅ Pipeline completo: build + distribución + PyPI"
        }
        failure {
            echo "❌ Falló el pipeline"
        }
    }
}