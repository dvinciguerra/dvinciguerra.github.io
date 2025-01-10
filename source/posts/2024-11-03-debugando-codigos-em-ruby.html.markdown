---
title: Debugando códigos em Ruby
date: 2024-11-03 19:36 UTC
tags: ruby, debug, pry, byebug, irb
category: tech
layout: post
---


Eu realmente gosto muito das ferramentas de desenvolvimento (devtools) disponíveis para Ruby. Elas são poderosas e facilitam bastante a vida de quem está desenvolvendo. Neste post, vou falar sobre algumas dessas ferramentas e como usá-las para debugar seus códigos Ruby.

## Interactive Ruby - IRB

Que Ruby é uma linguagem extremamente poderosa e produtiva, acho que é bem claro para quem a utiliza no dia a dia, mas preciso dizer: sou um grande fã do REPL IRB.

REPL é a abreviação de Read-Eval-Print Loop, um ambiente de programação interativo que permite escrever expressões em uma linha de comando e executá-las imediatamente.

Isso é muito útil para criar provas de conceito (PoC), debugar comportamentos ou resolver problemas rapidamente.

O IRB é, sem dúvida, a ferramenta mais básica e simples que temos para debugar códigos Ruby, mas também uma das mais importantes.


## Bindings

Bindings são pontos de parada (breakpoints) que você pode inserir no código para inspecionar variáveis, métodos e muito mais.

Combinado ao irb, adicionar um binding.irb no código é uma das formas mais simples e eficazes de depuração, permitindo inspecionar variáveis e métodos no contexto desejado.

Apesar de termos ferramentas que estendem as funcionalidades do REPL, como o Byebug e o Pry, o IRB é nativo e não requer dependências adicionais, o que o torna prático e acessível.


## Pretty Print - pp

Seguindo a clássica, porém ainda muito prática, estratégia de debugar com mensagens no stdout, o pp nos permite inspecionar objetos de forma mais amigável.

Ele chama o método #inspect dos objetos passados como argumento, mas apresenta o resultado de maneira mais legível, o que é extremamente útil para lidar com estruturas mais complexas.


## Rails Console

O Rails é um software incrível, e uma das suas grandes vantagens é facilitar não apenas a criação de novas aplicações, mas também a manutenção das existentes.

Uma ferramenta essencial para isso é o rails console, um ambiente interativo que carrega todo o contexto da aplicação, permitindo interagir programaticamente com ela.

É excelente para consultar informações, testar comportamentos, corrigir problemas e, claro, debugar códigos. É simplesmente fantástico.


## Rails Runner

Ainda falando sobre o Rails, o rails runner é uma ferramenta que permite rodar scripts Ruby no contexto da aplicação.

Embora não seja exatamente uma ferramenta de desenvolvimento ou depuração, ela é extremamente útil em ambientes de desenvolvimento. Com ela, é possível escrever pequenos scripts para testar comportamentos ou extrair informações rapidamente.


## RSpec

Pode parecer clichê, mas eu realmente gosto muito do RSpec. Ele é uma ferramenta poderosa que nos ajuda a escrever testes de forma legível e organizada.

Escrever testes é, muitas vezes, uma forma eficaz de debugar códigos, pois permite validar comportamentos e verificar se o código está funcionando como esperado.

Quando estou com dificuldade para entender um código, costumo escrever testes no mesmo arquivo e utilizo o autorun para executá-los automaticamente. Isso ajuda bastante a esclarecer comportamentos confusos e a identificar problemas conforme o código evolui.


## Conclusão

Essas são algumas das ferramentas que uso para debugar códigos Ruby. Elas são muito poderosas e me ajudam a entender o que está acontecendo no código, o que é fundamental no dia a dia de desenvolvimento.

Esse é um dos motivos pelos quais eu gosto tanto de Ruby: o tooling da linguagem é simplesmente incrível.
