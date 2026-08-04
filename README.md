cat > /mnt/data/README.md << 'EOF'
# 📘 FileConverterCLI

FileConverterCLI es una CLI en Python que permite convertir archivos desde la terminal y ejecutarse como comando global.

---

## 🎯 Objetivo

- Empaquetar la app como librería instalable
- Crear comando global (`fileconverter`)
- Automatizar build con Jenkins en Docker
- Generar artefactos (`.whl` y `.tar.gz`)
- Guardar resultado en carpeta local

---

## 🧱 Estructura

FileConverterCLI/
├── src/
│   ├── converters/
│   ├── services/
│   ├── utils/
│   ├── cli.py
│   ├── main.py
│   └── __init__.py
├── requirements.txt
├── pyproject.toml

---

## ⚙️ pyproject.toml

[build-system]
requires = ["setuptools>=61", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "fileconvertercli"
version = "1.0.0"
description = "Conversor de archivos"
authors = [{name="Santiago"}]

dependencies = []

[project.scripts]
fileconverter = "src.main:main"

---

## 🧠 Cómo funciona

fileconverter = "src.main:main"

Esto crea el comando global:

fileconverter

---

## ▶️ Ejecución

python src/main.py

---

## 🚀 Uso como CLI

pip install fileconvertercli
fileconverter

---

## 🐳 Jenkins con Docker

docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts

Acceso:
http://localhost:8080

Obtener contraseña:

docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

---

## ⚙️ Jenkinsfile

pipeline {
    agent any

    environment {
        OUTPUT_DIR = "/var/jenkins_home/builds/fileconvertercli"
    }

    stages {

        stage('Checkout') {
            steps {
                git url: 'https://github.com/tu_usuario/tu_repo.git'
            }
        }

        stage('Install') {
            steps {
                sh '''
                    python3 -m pip install --upgrade pip
                    pip install build setuptools wheel
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Build') {
            steps {
                sh 'python3 -m build'
            }
        }

        stage('Save') {
            steps {
                sh '''
                    mkdir -p $OUTPUT_DIR
                    cp dist/* $OUTPUT_DIR/
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Build terminado"
        }
    }
}

---

## 📦 Resultado

dist/
├── fileconvertercli-1.0.0-py3-none-any.whl
├── fileconvertercli-1.0.0.tar.gz

---

## ✅ Flujo

Código → Jenkins → Build → dist → Carpeta local → CLI global
EOF