---
title: Como transformar um sistema simples em um Frankenstein sem querer
date: 2025-03-16 23:08 UTC
tags: software, arquitetura, design
category: tech
layout: post
---

...ou o perigo de tentar resolver problemas que você ainda não entendeu.

Você já trabalhou em um projeto onde cada parte do código parecia seguir uma filosofia diferente? Onde MVC, Clean Architecture, DDD, Service Objects, Interactors e um monte de camadas extras coexistiam, mas ninguém sabia exatamente quando e por que cada coisa foi adicionada?

Se sim, você já viu um Frankenstein arquitetural de perto.

E se não... calma que sua hora vai chegar.

## MVC: Simples, mas nem todo mundo entende

O padrão _Model-View-Controller_ (MVC) já foi o queridinho do desenvolvimento web. Ainda é, na real. Simples, direto e fácil de entender:

- **Model** → cuida dos dados e regras de negócio.
- **View** → exibe as informações pro usuário.
- **Controller** → recebe requisições, faz a ponte entre Model e View.


Até aí, tudo lindo. O problema não é o MVC. O problema é que as pessoas não estudam direito como aplicar MVC antes de decidir que ele "não é suficiente".

Aí começam os improvisos:

"Vamos criar um Service Object pra organizar isso!",
"Que tal um Interactor?",
"E se a gente usar Clean Architecture?",
"O sistema tá uma bagunça, bora aplicar DDD!".


De repente, aquele código que era só um Model, um Controller e uma View, vira um sistema onde ninguém mais sabe onde colocar código novo.

A equipe não discute mais regras de negócio. Agora, as discussões são sobre "Onde eu coloco essa lógica?" porque cada dev acha que tem que seguir um padrão diferente.

O que era simples agora virou uma jornada épica pra entender como o código funciona.

## Mas pera... então Service Objects e afins são ruins?

Não, não são. O problema não é criar novas camadas. O problema é criar camadas sem entender a necessidade real.

MVC pode ter limitações? Sim. Mas antes de sair metendo Service Object, Port & Adapter, Domain Service e o escambau, vale a pena perguntar:

O problema é o padrão ou a forma como estamos aplicando ele?

Muitas vezes, os problemas em sistemas grandes não vêm da falta de camadas, mas da falta de disciplina na aplicação do próprio MVC.

Se ninguém entende onde colocar a lógica, talvez o problema não seja a falta de abstrações, mas sim a falta de organização dentro do que já existe.

## O perigo da ansiedade em aplicar padrões

Aqui entra outro problema clássico: a ânsia de aplicar tudo o que aprendemos, sem entender profundamente os conceitos.

Já viu devs que assistem um vídeo sobre Clean Architecture e, no dia seguinte, querem refatorar o sistema todo?
Ou alguém que leu sobre DDD e já quer transformar cada regra de negócio em um agregado?

Esse é um dos maiores perigos da nossa área: aplicar conhecimento sem realmente entender ele.

A verdade é que cada sistema tem um contexto, e nenhum padrão resolve tudo.
Você pode seguir MVC puro e ter um código incrível. Você pode usar Clean Architecture e criar um monstro difícil de manter.

No fim, o problema não está nos padrões, mas na forma como eles são aplicados.

## Como evitar que seu sistema vire um Frankenstein?

Aqui vão algumas dicas pra evitar o caos arquitetural:

**1 - Entenda bem o padrão antes de tentar "melhorá-lo".**

MVC puro já resolve muita coisa se for bem aplicado.
Antes de sair criando Service Objects, pergunte: "Isso realmente não cabe num Model?"


**2 - Novas camadas só devem ser criadas quando há um problema real.**

Criar camadas porque "todo mundo faz assim" não é argumento.
Se o problema for código desorganizado, a solução pode ser organizar melhor o que já existe.


**3 - Arquitetura deve ser um consenso do time, não uma decisão individual.**

Se cada dev aplica um padrão diferente, o sistema perde coesão.
Se vamos adicionar uma camada nova, todo mundo precisa entender o porquê.


**4 - Simplicidade é um superpoder.**

Um código fácil de entender é melhor do que um código "sofisticado" que ninguém sabe mexer.
A melhor arquitetura não é a mais complexa, é a que o time consegue manter sem dor de cabeça.


## Conclusão

A arquitetura do seu sistema não deve ser definida com base no hype do momento.
Ela precisa fazer sentido pro time, pro projeto e pro negócio.

MVC pode ser suficiente? Pode.
Adicionar camadas extras pode ser necessário? Também pode.
Mas só faz sentido se for resolver um problema real e se as pessoas souberem usar.

No fim, o maior desafio da arquitetura de software não é técnico, é humano: garantir que todos entendam e sigam um modelo organizacional coeso.
