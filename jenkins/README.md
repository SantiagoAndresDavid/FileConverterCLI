# Proyecto: CI/CD para Python con Jenkins + Terraform en Azure

## Objetivo

Construir una plataforma de Integración Continua (CI) utilizando **Terraform**, **Azure**, **Docker** y **Jenkins** para automatizar el ciclo de vida de una librería Python.

El flujo permitirá que cada cambio realizado en el repositorio sea compilado, probado y publicado automáticamente en PyPI.

---

# Arquitectura General

```text
                    +---------------------------+
                    |       GitHub Repository   |
                    +------------+--------------+
                                 |
                                 |
                           Git Push / PR
                                 |
                                 ▼
                    +---------------------------+
                    |         Jenkins           |
                    |      (Docker Compose)     |
                    +------------+--------------+
                                 |
             Docker Socket       |
                                 ▼
               +------------------------------+
               |  Contenedor python:3.12-slim |
               |                              |
               | Setup                        |
               | Test                         |
               | Build                        |
               | Publish                      |
               +--------------+---------------+
                              |
                              |
                              ▼
                     +------------------+
                     |      PyPI        |
                     +------------------+

```

---

# Arquitectura en Azure

```text
                      Azure Subscription
                              │
                              │
                 Terraform Provisioning
                              │
                              ▼
                   Resource Group (RG)
                              │
                              ▼
                     Virtual Network
                              │
                              ▼
                      Public IP Address
                              │
                              ▼
                     Network Security Group
                              │
                              ▼
                       Ubuntu Virtual Machine
                              │
              ┌───────────────┴───────────────┐
              │                               │
              ▼                               ▼
        Docker Engine                 Docker Compose
              │
              ▼
        Jenkins Container
              │
              ▼
      Docker Agent (Python)
```

---

# Tecnologías

| Tecnología | Propósito |
|------------|-----------|
| Terraform | Infraestructura como Código |
| Azure | Proveedor Cloud |
| Ubuntu Server | Sistema Operativo |
| Docker | Contenedores |
| Docker Compose | Orquestación local |
| Jenkins | CI/CD |
| GitHub | Código fuente |
| PyPI | Publicación del paquete |

---

# Infraestructura que creará Terraform

Terraform será responsable únicamente de la infraestructura.

## Resource Group

Contenedor lógico de todos los recursos.

```
rg-python-ci
```

---

## Virtual Network

```
vnet-python-ci
```

Ejemplo

```
10.0.0.0/16
```

---

## Subnet

```
subnet-jenkins
```

Ejemplo

```
10.0.1.0/24
```

---

## Public IP

```
pip-jenkins
```

Será utilizada para acceder desde Internet.

---

## Network Security Group

Abrirá únicamente los puertos necesarios.

| Puerto | Uso |
|---------|-----|
|22|SSH|
|8080|Jenkins|
|443|HTTPS (futuro)|

---

## Máquina Virtual

Ubuntu LTS

Ejemplo

```
Standard_B1s
```

Recursos

- 1 vCPU
- 1 GB RAM
- SSD

Suficiente para un proyecto Python pequeño.

---

## Disco

SSD administrado.

Ejemplo

30 GB.

---

# Lo que NO crea Terraform

Terraform no instalará aplicaciones.

Su responsabilidad termina cuando la VM está disponible.

Después se instalarán:

- Docker
- Docker Compose
- Jenkins

---

# Configuración de la VM

Una vez creada la máquina:

```
SSH
```

Actualizar el sistema.

```
sudo apt update
```

Instalar Docker.

```
sudo apt install docker.io
```

Instalar Docker Compose.

```
sudo apt install docker-compose-v2
```

Iniciar Docker.

```
sudo systemctl enable docker
sudo systemctl start docker
```

---

# Jenkins

Jenkins se ejecutará como un contenedor Docker.

```
Ubuntu VM
        │
        ▼
Docker Engine
        │
        ▼
Jenkins Container
```

No se instalará directamente sobre Ubuntu.

---

# Docker Compose

Docker Compose administrará el ciclo de vida del contenedor Jenkins.

Responsabilidades:

- Descargar Jenkins
- Crear el volumen persistente
- Exponer el puerto 8080
- Reiniciar Jenkins automáticamente

---

# Volumen Persistente

```
jenkins_home
```

Aquí se almacenará:

- Jobs
- Plugins
- Usuarios
- Credenciales
- Historial de Builds

Aunque el contenedor sea eliminado, esta información permanecerá.

---

# Docker Socket

Se montará:

```
/var/run/docker.sock
```

Esto permitirá que Jenkins controle Docker del host.

Gracias a ello el Jenkinsfile podrá ejecutar:

```groovy
agent {
    docker {
        image 'python:3.12-slim'
    }
}
```

---

# Pipeline

El pipeline tiene cuatro etapas.

## Setup

Responsabilidades

- Descargar imagen Python
- Actualizar pip
- Instalar dependencias
- Instalar build
- Instalar twine

---

## Test

Ejecutar

```
pytest
```

Si algún test falla:

- Se detiene el pipeline.

---

## Build

Construir el paquete.

Generará:

```
dist/

package.whl

package.tar.gz
```

---

## Publish

Autenticación mediante Credentials de Jenkins.

Publicación automática.

```
PyPI
```

---

# Flujo completo

```
Git Push

      │

      ▼

Webhook GitHub

      │

      ▼

Jenkins

      │

      ▼

Levanta contenedor Python

      │

      ▼

Setup

      │

      ▼

Tests

      │

      ▼

Build

      │

      ▼

Twine Upload

      │

      ▼

PyPI
```

---

# Responsabilidades de Terraform

Terraform administrará únicamente la infraestructura.

```
Terraform

│

├── Resource Group

├── Virtual Network

├── Subnet

├── Public IP

├── NSG

├── Ubuntu VM

└── Asociaciones de red
```

No administrará:

- Jenkins
- Docker
- Docker Compose
- Plugins
- Pipelines

---

# Futuras mejoras

## HTTPS

Agregar:

- Nginx
- Let's Encrypt

---

## DNS

```
jenkins.midominio.com
```

---

## Azure Key Vault

Mover:

- Token PyPI
- Credenciales GitHub

---

## Azure Container Registry (ACR)

Guardar imágenes privadas.

---

## Kubernetes

Migrar Jenkins a:

- Azure Kubernetes Service (AKS)

---

## Agentes Distribuidos

Agregar múltiples agentes para:

- Python
- Java
- Node.js
- Docker
- Terraform

---

# Estructura del proyecto

```
terraform/

│
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── network.tf
├── vm.tf
└── security.tf

jenkins/

└── docker-compose.yml

Jenkinsfile

README.md
```

---

# Flujo de aprovisionamiento

```text
Terraform Init
        │
        ▼
Terraform Plan
        │
        ▼
Terraform Apply
        │
        ▼
Azure crea la infraestructura
        │
        ▼
SSH hacia la VM
        │
        ▼
Instalación de Docker
        │
        ▼
Docker Compose
        │
        ▼
Jenkins
        │
        ▼
Configuración inicial
        │
        ▼
Creación del Pipeline
        │
        ▼
Publicación automática en PyPI
```

---

# Objetivo de aprendizaje

Este proyecto permite practicar de forma integrada:

- Terraform (Infraestructura como Código)
- Azure (Cloud Computing)
- Redes virtuales y seguridad
- Máquinas virtuales
- Docker
- Docker Compose
- Jenkins
- Pipelines CI/CD
- Gestión de credenciales
- Publicación de paquetes Python en PyPI
- Buenas prácticas de automatización e infraestructura