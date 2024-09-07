---
title: Como eu organizo e mantenho meus dotfiles
date: 2024-09-07 00:00 UTC
tags: dotfiles, git, github, shell, zsh, tmux, neovim
category: tech
layout: post
---

Dotfiles são arquivos que controlam as configurações do meu ambiente de desenvolvimento, como o terminal e editores de texto. Mantê-los organizados facilita a portabilidade entre máquinas e garante um ambiente consistente. Neste artigo, compartilho como organizo e mantenho meus dotfiles, destacando as ferramentas e boas práticas que uso.

## Por que manter os dotfiles organizados?
Manter os dotfiles organizados facilita muito a vida. Quando preciso configurar uma nova máquina, é só copiar tudo e já tenho meu ambiente de volta, sem dor de cabeça. Além disso, usando Git, consigo rastrear todas as mudanças que fiz, então se algo der errado ou eu quiser voltar atrás, está tudo documentado.

## Como eu organizo meus dotfiles
Eu mantenho meus dotfiles em um repositório no GitHub, o que facilita a sincronização entre máquinas. Para gerenciar a instalação, uso o Itamae, uma ferramenta de gerenciamento de configurações. Criei uma extensão para o Itamae que facilita a criação de links simbólicos, o que torna o processo muito simples. Isso me permite selecionar facilmente quais arquivos aplicar em diferentes sistemas operacionais. Como o Itamae é escrito em Ruby, consigo criar extensões sempre que preciso, o que dá bastante flexibilidade.

## Dotfiles e configurações essenciais
No meu setup, alguns dotfiles são indispensáveis. As configurações do Zsh, Git, Neovim e Ruby são fundamentais para o meu fluxo de trabalho. Além disso, mantenho alguns scripts que uso diariamente para automatizar tarefas e facilitar a rotina.

Também dou bastante atenção às configurações do ambiente, como o terminal e ferramentas como SSH, GPG, Tmux/Zellij, FZF, e Docker. Tudo isso ajuda a garantir que o ambiente esteja pronto para o desenvolvimento. Ferramentas específicas para desenvolvimento em Ruby, como algumas gems, também fazem parte do setup para otimizar o dia a dia.

Por fim, faço questão de instalar os apps que uso com mais frequência, garantindo que a produtividade não seja interrompida.

## Script para gerenciamento de dotfiles com Itamae

Para manter meus dotfiles organizados e garantir que estejam sempre atualizados nos diferentes ambientes que utilizo, desenvolvi uma extensão no Itamae para facilitar a criação de links simbólicos. O script abaixo define uma função `dotfile`, que faz o gerenciamento dessas configurações automaticamente, criando symlinks entre os arquivos de configuração e os diretórios de destino.

```ruby
# frozen_string_literal: true

require 'specinfra_termux'

os_info = `uname -a`

is_android = os_info.match?(/android/i)
is_darwin = os_info.match?(/darwin/i)
is_linux = os_info.match?(/linux/i)

Itamae.logger.debug("OS Info: #{os_info}")

# creating dotfiles symlink configurations
define(:dotfile, source: nil, target: nil) do
  source = params['source'] || params['name']
  target = params['target'] || source

  source_path = "#{File.expand_path(__dir__)}/config/#{source}"
  target_path = File.join(Dir.home, target)

  directory File.dirname(target_path)

  link target_path do
    to source_path
    force true
  end
end
```

Esse script usa o Itamae para verificar o sistema operacional atual e criar links simbólicos para os arquivos de configuração armazenados em um diretório específico. Assim, ao configurar uma nova máquina, basta executar o script para garantir que todos os dotfiles estejam no lugar certo, independentemente do sistema que estou usando.

## Manutenção dos meus dotfiles
Eu faço commits regulares no meu repositório de dotfiles, mas prefiro atualizar manualmente em cada ambiente. Embora pudesse automatizar esse processo, como, por exemplo, verificar se o repositório está desatualizado ao iniciar o terminal e atualizar automaticamente, gosto de ter mais controle sobre quando e como as atualizações são aplicadas. Isso me dá mais segurança, especialmente em ambientes diferentes, onde nem sempre quero que as mudanças aconteçam sem supervisão.

## Considerações Finais
Este texto reflete muito da minha experiência pessoal, mas se tem algo que eu aprendi é que o mais importante é manter seus dotfiles, suas versões e backups. Esses arquivos são cruciais para garantir que você possa configurar rapidamente seu ambiente e começar a trabalhar nas suas tarefas e projetos sem perder tempo.

Já passei por situações onde precisei configurar manualmente meu ambiente várias vezes, e isso é sempre demorado. Além disso, é fácil esquecer de instalar ou configurar algo importante. Por isso, sempre que for possível, prefira usar código para configurar seu ambiente. Isso vai tornar sua vida muito mais fácil a longo prazo.




