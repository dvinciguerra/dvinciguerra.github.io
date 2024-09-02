---
title: Configurando dominios do meu Homelab na Cloudflare usando Terraform
date: 2024-08-28 14:08 UTC
tags: terraform, cloudflare, homelab, dns, infraestrutura, devops
category: tech
layout: post
---

Uma das coisas mais divertidas e uteis que fiz quando comecei a montar meu homelab foi configurar os registros DNS dos
meus domínios na Cloudflare apontando para as maquinas nas rede. Além de ser uma ferramenta gratuita para esse uso mais
simples, a Cloudflare oferece uma série de recursos que ajudam a melhorar a segurança e performance dos sites.

Neste post, vou mostrar como eu fiz esse processo utilizando o terraform.

## O que é Terraform?

Terraform é uma ferramenta de infraestrutura como código (IaC) que permite criar, alterar e versionar a infraestrutura
de forma segura e eficiente. Com ele, é possível gerenciar diversos provedores de nuvem, como AWS, Azure, Google Cloud,
entre outros.

Passei muitos anos configurando maquinas manualmente e, acredite, é um processo bem chato e propenso a erros. Nos dias
de hoje, com a popularização das ferramentas e do conceito de IaC, não é mais aceitável construirmos infraestruturas
de forma manual, mesmo que seja para coisas simples, visto que vamos esquecer o que fizemos, como fizemos, não
conseguimos aproveitar em outros projetos... enfim, é um caos.

## Instalando o Terraform

Para começar, você precisa instalar o terraform na sua maquina. Você pode baixar o binário no site oficial ou instalar
via gerenciador de pacotes da sua distribuição.

Para instalar no Ubuntu, por exemplo, você pode executar os seguintes comandos:

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

Se estiver usando o MacOS, você pode instalar o terraform via Homebrew:

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

## Criando o script

Agora, vamos criar o script que vai configurar os registros DNS na Cloudflare. Crie um arquivo chamado `main.tf` e
adicione o seguinte conteúdo:

```hcl
# enable required providers
terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}

# env variables
variable "CLOUDFLARE_API_TOKEN" {
  description = "Cloudflare API Token"
}

variable "CLOUDFLARE_ZONE_ID" {
  description = "Cloudflare Zone ID"
}

variable "CLOUDFLARE_ACCOUNT_ID" {
  description = "Cloudflare Account ID"
}

variable "CLOUDFLARE_DOMAIN" {
  description = "Cloudflare Domain"
  default     = "example.com.br"
}

provider "cloudflare" {
  api_token = "${var.CLOUDFLARE_API_TOKEN}"
}

# resources
resource "cloudflare_record" "foo_example_com_br" {
  zone_id = "${var.CLOUDFLARE_ZONE_ID}"
  name    = "foo"
  value   = "192.168.0.100"
  type    = "A"
  ttl     = 300
}

resource "cloudflare_record" "bar_example_com_br" {
  zone_id = "${var.CLOUDFLARE_ZONE_ID}"
  name    = "bar"
  value   = "192.168.0.101"
  type    = "A"
  ttl     = 300
}
```

Neste script (fictício), estamos criando dois registros DNS na Cloudflare, um para o domínio `homelab.com` e outro para o
subdomínio `blog.homelab.com`. Note que o valor dos registros está vazio, pois vamos preencher com o IP das maquinas
na rede.

Para simplificar minha vida, eu também criei um arquivo `.env` com as variáveis de ambiente que o terraform vai usar.

```env
TF_VAR_CLOUDFLARE_API_TOKEN=TF_VAR_CLOUDFLARE_API_TOKEN
TF_VAR_CLOUDFLARE_ZONE_ID=TF_VAR_CLOUDFLARE_ZONE_ID
TF_VAR_CLOUDFLARE_ACCOUNT_ID=TF_VAR_CLOUDFLARE_ACCOUNT_ID
TF_VAR_CLOUDFLARE_DOMAIN=TF_VAR_CLOUDFLARE_DOMAIN
```

## Aplicando as configurações

Para aplicar as configurações, execute os seguinte:

Com o uso da ferramenta dotenv, carregar o `.env` e posso executar o comando `terraform plan` para verificar se está
tudo certo.

```bash
dotenv -f .env terraform plan
```

Se tudo estiver correto, você pode aplicar as configurações com o comando:

```bash
dotenv -f .env terraform apply
```

O terraform vai criar os registros DNS na Cloudflare de acordo com o script que criamos. Depois de aplicar as
configurações, você pode acessar o painel da Cloudflare e verificar se os registros foram criados corretamente.

E é isso! Agora você tem seus domínios configurados na Cloudflare de forma automatizada.

