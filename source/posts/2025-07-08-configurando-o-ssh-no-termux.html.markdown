---
title: Configurando o SSH no Termux
date: 2025-07-08 00:15 UTC
tags: mobile, termux, ssh, terninal, config, connection
category: tech
layout: post
---

![](./2025-07-08-configurando-o-ssh-no-termux/banner.png)

O Termux é um emulador de terminal para Android que permite executar comandos de linha de comando e instalar pacotes Linux. Configurar o SSH no Termux pode ser útil para acessar remotamente o seu dispositivo Android ou para se conectar a outros servidores.

Eu particularmente gosto de usar o Termux para acessar remotamente os servidores no meu homelab,e fazer algumas tarefas ou ate para pequenas manutenções.

Mas utilizando ele você também pode hospedar aplicações no seu dispositivo, como
apps web e serviços, o que pode ser útil para dar uso a um aparelho antigo ou
simplesmente desenvolver ou testar projetos.

Por isso, neste post, vou mostrar como configurar o SSH no Termux.

## Instalando o openssh

Primeiro, você precisa instalar o pacote `openssh` no Termux. Abra o Termux e execute o seguinte comando:

```bash
pkg install openssh
```

Isso instalará o OpenSSH, que é o servidor SSH que você usará para se conectar ao seu dispositivo Android.

## Iniciando o servidor ssh

Depois de instalar o OpenSSH, você pode iniciar o servidor SSH com o seguinte comando:

```bash
sshd
```

Geralmente, para garantir que não haja outro processo em execução, gosto de executar o comando junto com o `pkill`.

```bash
pkill sshd && sshd
```

## Configurando o servidor ssh

O arquivo de configuração do servidor SSH está localizado em `/data/data/com.termux/files/usr/etc/ssh/sshd_config`. Você pode editar esse arquivo para ajustar as configurações do servidor SSH. Por exemplo, você pode alterar a porta padrão (22) para outra porta, desabilitar o login de root, etc.

Para editar o arquivo de configuração, você pode usar um editor de texto como o `vim` ou `nano`. Por exemplo, para editar com o `vim`, execute:

```bash
vim $PREFIX/etc/ssh/sshd_config
```

Adicione ou modifique as seguintes linhas conforme necessário:

```plaintext
# Desabilitar o login de root
PermitRootLogin no

# Habilitar autenticação por chave pública
PubkeyAuthentication yes

# Habilitar autenticação por senha
PasswordAuthentication yes
```

## Gerando a senha no Termux

Acoselho que você configure a permissão de autenticação por chave pública, que é mais segura do que a autenticação por senha. Mas, se você não for capaz de copiar sua chave para a configuracao, pode ser necessario que voce defina uma senha para fazer isso atravéz do comando `ssh-copy-id`.

Entao, para definir uma senha, execute:

```bash
passwd
```

Isso solicitará que você insira uma nova senha para o usuário atual.

O termux não possui um usuário root por padrão, então você estará configurando a senha para o usuário padrão do Termux.

Para saber o nome do usuário, você pode usar o comando `whoami`:

```bash
whoami
```

## Conectando ao servidor SSH

Agora que o servidor SSH está em execução, você pode se conectar a ele usando um cliente SSH. No seu computador, abra um terminal e execute o seguinte comando:

```bash
ssh username@ip_address
```

Substitua `username` pelo nome de usuário do Termux (geralmente é o mesmo nome de usuário do Android) e `ip_address` pelo endereço IP do seu dispositivo Android.

## Copian1do a chave pública

Se você quiser usar autenticação por chave pública, primeiro você precisa gerar um par de chaves SSH no seu computador (se ainda não tiver feito isso). Execute o seguinte comando no terminal do seu computador:

```bash
ssh-keygen -t rsa -b 4096
```

Isso criará um par de chaves SSH (uma chave pública e uma chave privada) no diretório `~/.ssh/`.

Depois de gerar as chaves, você precisa copiar a chave pública para o Termux. Você pode fazer isso usando o comando `ssh-copy-id`:

```bash
ssh-copy-id username@ip_address
```

Se tudo deu certo, você deve conseguir se conectar ao Termux sem precisar digitar a senha.

## Melhorando a conexão

Para melhorar a conexão SSH, você pode adicionar a seguinte linha ao arquivo de configuração do SSH no seu computador (`~/.ssh/config`):

```plaintext
Host termux
    HostName ip_address
    User username
    Port 8022 # ou a porta configurada no Termux
```

Isso permitirá que você se conecte ao Termux usando o comando `ssh termux`, sem precisar digitar o nome de usuário e o endereço IP toda vez.

Assim que terminar de utilizar o SSH no Termux, você pode parar o servidor SSH com o seguinte comando:

```bash
pkill sshd
```

Evite deixar o servidor SSH em execução quando não estiver em uso, pois isso pode representar um risco de segurança alem do consumo de recursos do dispositivo como bateria e processamento.

## Extra: Configurando tudo usando o Itamae

Se você quiser automatizar a configuração do SSH no Termux, pode usar o Itamae, que é uma ferramenta de automação de configuração. Com o Itamae, você pode criar um script para instalar e configurar o SSH no Termux automaticamente.

Para fazer isso, crie um arquivo chamado `ssh.rb` com o seguinte conteúdo:

```ruby
package 'openssh' do
  action :install
end

execute 'start sshd' do
  command 'pkill sshd && sshd'
  action :run
end

file '/data/data/com.termux/files/usr/etc/ssh/sshd_config' do
  content <<-EOF
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication yes
  EOF
  action :create
end

execute 'set password' do
  command 'passwd'
  action :run
end
```

Depois, execute o Itamae com o seguinte comando:

```bash
itamae ssh.rb
```

Isso instalará o OpenSSH, iniciará o servidor SSH e configurará o arquivo `sshd_config` automaticamente.

Espero ter ajudado você a configurar o SSH no Termux!
