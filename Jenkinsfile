pipeline {
    agent any

    stages {

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
                . venv/bin/activate

                if [ -f requirements.txt ]; then
                    pip install -r requirements.txt
                fi
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                . venv/bin/activate

                if [ -d tests ]; then
                    python -m unittest discover -s tests
                else
                    echo "No tests found"
                fi
                '''
            }
        }

        stage('Build Package') {
            steps {
                sh '''
                . venv/bin/activate
                python -m build
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
                    . venv/bin/activate
                    python -m twine upload dist/* --non-interactive
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
            echo "❌ Pipeline falló - limpiando workspace"
            sh '''
            rm -rf venv dist build *.egg-info
            '''
        }

        always {
            echo "🧹 Limpieza final del workspace"
            cleanWs()
        }
    }
}