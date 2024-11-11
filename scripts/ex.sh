# criar uma chave ssh
ssh-keygen -t rsa -b 2048 -f ~/.ssh/ec2
# para pegar a chave pública ssh
cat ~/.ssh/ec2.pub

# colar a chave pública no arquivo ssh.txt

# para saber a credenciais da aws
cat ~/.aws/credentials

# coloca no terminal, para que o terraform possa se conectar com a sua conta da aws
# até o fim da sessão do terminal
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""

# iniciar
terraform init && terraform fmt && terraform validate && \
 terraform plan -out plan.out && terraform apply plan.out

# conexão com a "vm pública" via ssh
ssh ec2-user@44.211.220.7
# verificar conexão da "vm pública" com a "vm privada"
ping <ip-da-vm-privada>

# criar arquivo na pasta ssh
cd ~/.ssh && touch ec2

# no seu terminal
cat ~/.ssh/ec2

# editar arquivo
# colar a chave privada ec2
# para salvar edição control + o
# para sair do editor control + x 
nano ec2

# altera permissão do arquivo.
chmod 600 ec2

# para conectar da "vm pública" para "vm privada"
ssh -i ec2 ec2-user@<ip-da-vm-privada>

# deletar todos os recursos criado na aws
terraform destroy