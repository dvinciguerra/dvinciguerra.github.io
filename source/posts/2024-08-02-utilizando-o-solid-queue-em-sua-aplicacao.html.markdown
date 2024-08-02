---
title: Utilizando o Solid Queue em sua aplicação
date: 2024-08-02 13:25 UTC
tags: basecamp, solid-queue, rails, activejob, background-job, async-job, ruby
category: tech
layout: post
---


A um tempo, o Basecamp lançou uma nova ferramenta de background job compatível com o ActiveJob do Rails.

Essa ferramenta, mais tarde, foi promovida a uma lib do projeto Rails, para ser uma opção padrão para lidar com tarefas assíncronas em segundo plano.

O grande diferencial dessa ferramenta é o uso do banco de dados para manter os dados dos Jobs, ao invés das principais opções que fazem uso de in-memory storages como Redis.


## Instalando o Solid Queue

O processo de instalação do Solid Queue é super simple, bastando seguir os passos abaixo.

1. Adicione a gem ao seu Gemfile

```ruby
gem 'solid_queue'
```

2. Instale a gem

O comando abaixo irá instalar a gem e suas dependências.

```bash
bundle install
```

3. Crie a tabela no banco de dados

Como comentei anteriormente, o Solid Queue faz uso do banco de dados para armazenar os Jobs, então precisamos criar a
tabela que irá armazenar esses dados.

```bash
rails solid_queue:install:migrations
rails db:migrate
```

4. Configure o ActiveJob para usar o Solid Queue

Para que o ActiveJob use o Solid Queue como backend, precisamos configurar o arquivo de configuração do Rails.

```ruby
# config/application.rb
module Sample
  class Application < Rails::Application
    config.active_job.queue_adapter = :solid_queue
  end
end
```


## Criando nosso primeiro Job

Vamos supor que temos uma aplicação criada com o comando rails new sample e essa aplicação tenha um model que quando salvo, dispara uma notificação via email rails generate scaffold bookmarks title:string description:text.

Pensando neste cenário, vamos criar um job que, quando um novo registro for inserido, faça o envio de uma notificação via email.

```ruby
# app/jobs/send_notification_job.rb
class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(bookmark)
    # Aqui você pode chamar o método que envia o email
    # Exemplo: BookmarkMailer.with(bookmark: bookmark).new_bookmark.deliver_now
    puts "Enviando notificação para #{bookmark.title}"
  end
end
```


## Executando e acompanhando

Para que os Jobs sejam executados, precisamos iniciar o processo que irá monitorar a tabela de Jobs e executá-los.

```bash
rails solid_queue:work
```



## Simplificando o monitoramento com Mission Control

Assim como Resque, Sidekiq e outras soluções consolidadas, o Solid Queue também possui um dashboard onde nos podemos acompanhar como está o processo de execução dos Jobs.

Ele é entregue em uma gem separada, chamada `mission_control-jobs`, e podemos instalar ela com os seguintes passos.

**1 - Adicione a gem ao seu Gemfile**

```ruby
gem 'mission_control-jobs'
```

**2 - Instale a gem**

```bash
bundle install
```

**3 - Adicione a rota ao seu arquivo de rotas**

```ruby
# config/routes.rb

Rails.application.routes.draw do
  mount MissionControl::Jobs::Engine => "/mission_control"
end
```

**4 - Acesse o dashboard**

Agora, basta acessar a rota `http://localhost:3000/mission_control` da sua aplicação para visualizar o dashboard.


![Mission Control](2024-08-02-utilizando-o-solid-queue-em-sua-aplicacao/queues-multiple.png)


## Conclusão

O Solid Queue é uma solução simples e bem interessante para lidar com Jobs em background, mas vale lembrar que ela não é a primeira que usa bancos de dados para isso.

De qualquer forma, estando sob o guarda-chuva do time do Rails e do Basecamp, imagino que podemos esperar uma ótima integração com as APIs e funcionalidades do Rails.

Fiz alguns testes e quero criar um novo artigo, explicando pontos que observei para melhorar a escalabilidade de soluções Rails usando o Solid Queue.

Muito obrigado pela visita e nos vemos no próximo post.
