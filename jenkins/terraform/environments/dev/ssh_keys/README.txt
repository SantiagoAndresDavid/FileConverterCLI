Generar las claves SSH aquí para uso local con Terraform.

- Coloca la clave pública como: `id_rsa.pub`
- NO subas la clave privada (`id_rsa`) al repositorio. Guarda la privada en tu `~/.ssh` o en un gestor de secretos.

Comandos sugeridos para generar una llave (local):

PowerShell:
ssh-keygen -t rsa -b 2048 -f .\ssh_keys\id_rsa -N "" -C "terraform@local"

Bash:
ssh-keygen -t rsa -b 2048 -f ./ssh_keys/id_rsa -N '' -C 'terraform@local'

Después de generar, `terraform plan -var-file=terraform.tfvars` desde la carpeta del ambiente.
