pipeline {
    agent any

    stages {

        stage('Setup') {
            steps {
                sh '''
                python3 --version

                # Crear entorno virtual
                python3 -m venv venv

                # Activar entorno
                . venv/bin/activate

                # Actualizar pip y herramientas dentro del venv
                python -m pip install --upgrade pip
                python -m pip install build twine
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                . venv/bin/activate

                if [ -f requirements.txt ]; then
                    python -m pip install -r requirements.txt
                fi
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                . venv/bin/activate
                python -m unittest discover -s test
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
            echo "❌ Pipeline falló - limpiando"
            sh '''
            rm -rf dist build *.egg-info venv
            '''
        }

        always {
            cleanWs()
        }
    }
}