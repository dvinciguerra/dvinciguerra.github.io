---
title: Como criar CLIs em Ruby - Parsers de argumentos
date: 2024-09-02 22:32 UTC
tags: ruby, cli, terminal, development, command-line
category: tech
layout: post
---

Uma das habilidades mais valiosas para desenvolvedores é se sentir à vontade no terminal. É onde temos o poder de controlar nosso ambiente de forma detalhada, aumentando nossa produtividade e automatizando tarefas com facilidade.

No entanto, nem sempre temos todas as ferramentas de que precisamos à mão. Às vezes, precisamos criar nossas próprias soluções a partir de um conjunto específico de operações. Para isso, é essencial entender como desenvolver ferramentas de linha de comando, também conhecidas como CLIs (Command Line Interfaces).

## Criando nossa primeira CLI em Ruby

Ruby nos oferece uma vasta coleção de gems para criar CLIs, mas também podemos optar por não usar nenhuma. A escolha é toda nossa e depende das nossas necessidades específicas. Neste artigo, vou compartilhar algumas das minhas preferências e mostrar exemplos práticos de como utilizá-las.

## Anatomia de um comando

Sem querer entrar em muitos detalhes técnicos (que vou explorar em outro artigo), é importante entender a estrutura básica de um comando. Embora não exista um padrão rígido, algumas recomendações e boas práticas ajudam a criar comandos que sejam intuitivos e fáceis de lembrar.

Geralmente, CLIs seguem um formato como este:

```bash
comando subcomando ação --param-booleano --param-texto="meu texto" --param-numerico=100
```

Para simplificar, vamos usar o `gh`, a ferramenta CLI do GitHub, como exemplo:

```bash
gh pr list --state=open --limit=10 --sort=created -R owner/repo
```

Este é o estilo que gosto de seguir ao criar CLIs, pois acho que é um padrão bem organizado e fácil de memorizar.

## Parsing de argumentos

Quando estamos criando uma CLI, podemos capturar todas as informações passadas como argumentos usando a variável `ARGV`.

```ruby
# exemplo.rb
puts ARGV
```

```bash
$ ruby exemplo.rb --param1=valor1 --param2=valor2
["--param1=valor1", "--param2=valor2"]
```

No entanto, quando lidamos com parâmetros, flags e valores, é útil ter um parser para simplificar essa tarefa. Ruby já nos oferece a gem `OptionParser` para isso, que vem na biblioteca padrão. Mas, para fins didáticos, vamos criar um parser simples baseado no comando `gh` que vimos antes.

Vamos criar um parser para um comando hipotético simples:

```ruby
# gh.rb

def parse_args(args)
  options = {}
  current_option = nil

  args.each do |arg|
    if arg.start_with?('--')
      key, value = arg.gsub('--', '').split('=')
      options[key] = value || true
    elsif arg.start_with?('-')
      current_option = arg.gsub('-', '').to_sym
      options[current_option] = true
    else
      options[current_option] = arg
    end
  end

  options
end

puts parse_args(ARGV)
```

```bash
$ ruby gh.rb pr list --state=open --limit=10 --sort=created -R owner/repo
{:state=>"open", :limit=>10, :sort=>"created", :R=>"owner/repo"}
```

Agora temos um hash com os parâmetros passados para o nosso comando. Não é nada muito complexo, mas é um bom começo para entender como lidar com argumentos em CLIs. E claro, não precisamos reinventar a roda; podemos usar a gem `OptionParser` para lidar com isso de forma mais robusta.

## Utilizando o OptionParser

`OptionParser` é uma gem que facilita muito a manipulação dos argumentos passados para o nosso comando.

```ruby
# gh.rb

require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: gh pr list [options]"

  opts.on("--state=STATE", "Filter by state") do |state|
    options[:state] = state
  end

  opts.on("--limit=LIMIT", "Limit the number of results") do |limit|
    options[:limit] = limit
  end

  opts.on("--sort=SORT", "Sort the results") do |sort|
    options[:sort] = sort
  end

  opts.on("-R", "--repository=REPOSITORY", "Repository to list PRs from") do |repository|
    options[:repository] = repository
  end
end.parse!

puts options
```

```bash
$ ruby gh.rb pr list --state=open --limit=10 --sort=created -R owner/repo
{:state=>"open", :limit=>"10", :sort=>"created", :repository=>"owner/repo"}
```

## Utilizando o Thor

`Thor` é uma gem que nos ajuda a criar CLIs mais robustas e organizadas, permitindo que criemos comandos e subcomandos de forma fácil e eficiente.

```ruby
# Gemfile

source 'https://rubygems.org'

gem 'thor'
```

```ruby
# gh.rb

require 'thor'

class Gh < Thor
  desc "pr list", "List pull requests"
  method_option :state, type: :string, desc: "Filter by state"
  method_option :limit, type: :numeric, desc: "Limit the number of results"
  method_option :sort, type: :string, desc: "Sort the results"
  method_option :repository, type: :string, desc: "Repository to list PRs from"
  def pr(*args)
    puts options
  end
end

Gh.start(ARGV)
```

```bash
$ ruby gh.rb pr list --state=open --limit=10 --sort=created -R owner/repo
{:state=>"open", :limit=>10, :sort=>"created", :repository=>"owner/repo"}
```

Usando Thor, podemos ver que a criação de comandos e subcomandos segue um padrão declarativo, mas utiliza classes em vez de um formato mais procedural. Pessoalmente, gosto de usar Thor para criar minhas CLIs, pois ele oferece várias opções e métodos que tornam a criação de comandos mais flexível e organizada.

## Conclusão

Essas são algumas formas de criar CLIs em Ruby. Como vimos, há várias opções para escolhermos ao criar nossas ferramentas. Neste artigo, compartilhei algumas das minhas preferências pessoais, mas existem muitas outras abordagens por aí. Escolha a que melhor se adapta às suas necessidades e mãos à obra!

