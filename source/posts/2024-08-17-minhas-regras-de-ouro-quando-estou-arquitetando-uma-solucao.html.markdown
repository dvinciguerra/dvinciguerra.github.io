---
title: Minhas regras de ouro quando estou arquitetando uma solução
date: 2024-08-17 02:16 UTC
tags: solution-architecture, software architecture, software engineering, system design
category: tech
layout: post
---


No ano passado (2023), completei 20 anos escrevendo software, sendo que 18 desses foram escrevendo software profissionalmente.

Durante todo esse tempo, já passei por projetos que foram incríveis e outros que eram um caos total. Alguns eram bem organizados, enquanto outros eram uma verdadeira bagunça. Também participei de projetos onde tentaram aplicar algum padrão arquitetural ou de engenharia, mas que nunca chegaram a um bom termo.

Por isso, criei algumas "regras de ouro" que sempre tento seguir e que acho que funcionam bem nesses cenários:

## 1. Design e Arquitetura São Sobre Comunicação

A arquitetura do seu software tem que ter a comunicação como o princípio mais importante.

Quem estiver desenvolvendo o projeto, e quem vai pegar ele no futuro, precisa entender rápido o raciocínio por trás dele e saber onde está e o que fazer.

## 2. Abstrações Simples Criam Projetos Simples

E o inverso também é verdade.

Se você começa seu projeto logo de cara com implementações super complexas, projetando para problemas que ainda nem existem, usando micro serviços e toda aquela sopa de letrinhas que os mais experientes já conhecem, seu projeto já nasce complicado. Isso acaba atrapalhando tanto o crescimento do negócio quanto a velocidade da sua equipe.

Simplicidade é a chave para projetos que duram e que são bem escritos.

Não adianta nada querer construir sistemas distribuídos se você ainda não entendeu bem como funciona um MVC básico.

Explore as opções, conheça os conceitos e mantenha tudo simples.

## 3. O Time Precisa Estar Alinhado

De novo falando sobre complexidade: não adianta você já ter estudado e aplicado com sucesso padrões arquiteturais em outros lugares se, no projeto atual, a sua equipe não entende as decisões que estão sendo tomadas.

Boas arquiteturas são aquelas que, assim como o código, são organizadas, fáceis de entender e ajudam todo mundo a se encontrar no projeto.

De que adianta uma arquitetura super sofisticada se ninguém vê valor nisso?

## 4. Pare de Escolher as Tecnologias da Moda

É importante que as pessoas entendam o que você está usando e por que está usando cada tecnologia.

Se você tem um projeto web simples, tipo um MVP, por que usar Kubernetes, Kafka, dividir o projeto em dezenas de pedaços, cada um com seu próprio servidor, e criar problemas que você não precisa?

## 5. Entenda que Tudo Tem Seus Prós e Contras

Se você quer criar boas soluções, entenda que cada escolha vai ter um lado negativo.

Por que não usar SSDs para tudo se eles são mais rápidos? Porque a vida útil deles é bem menor que a dos HDDs. Por que não usar Memory Stores no lugar de Bancos Relacionais? Porque, além de mais caros, esses bancos que usam memória RAM como armazenamento têm o problema da volatilidade.

Tudo tem seu lado bom e ruim, e entender isso logo, além de saber como usar essas características a seu favor, vai te ajudar a evitar escolhas ruins e impulsivas.

## Conclusão

Arquiteturas são muito mais sobre comunicação entre as pessoas do negócio e sobre entender o que funciona ou não em determinado contexto do que sobre seguir preferências pessoais.

Bons profissionais não criam soluções só para si mesmos, mas sim pensando na equipe, no negócio e, principalmente, nas pessoas que vão usar o projeto.

E isso é super importante, porque projetos que ninguém usa ou que não resolvem um problema são só um desperdício de tempo e dinheiro.
