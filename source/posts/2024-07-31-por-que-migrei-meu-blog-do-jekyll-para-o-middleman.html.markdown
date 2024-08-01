---
title: Por que Migrei Meu Blog do Jekyll para o Middleman
date: 2024-07-31 12:59 UTC
tags: jekyll, middleman, blog, migration, web, development
category: tech
layout: post
---

Migrar um blog de uma plataforma para outra é uma decisão significativa que pode ser motivada por diversas razões, desde 
melhorias na performance, melhores funcionalidades, etc. Recentemente, decidi migrar meu blog do Jekyll para o 
Middleman, e gostaria de compartilhar as razões que me levaram a fazer essa mudança e quais as minhas percepções sobre
a escolha e o processo.


## Porque o Jekyll?

O Jekyll é uma ferramenta popular para a criação de sites estáticos, talvez seja uma das mais conhecidas e certamente a 
que popularizou essa categoria de ferramentas com a simplicidade em criar sites estáticos, mesmo para que não conhecia a 
linguagem Ruby (na qual a ferramenta foi criada).

A sintaxe do Liquid, a facilidade de personalização e a comunidade ativa de plugins certamente foram fatores que me 
atraíram para o Jekyll.

No entanto, ao longo do tempo, comecei a sentir algumas limitações e desafios com o Jekyll que me levaram a considerar
outras opções, como o Middleman que ja conhecia.


## Porque o Middleman?

O Middleman é uma ferramenta de geração de sites estáticos construída em Ruby, que oferece uma abordagem mais flexível e 
personalizável para o desenvolvimento de sites, trazendo principalmente muito do que costumamos usar quando 
desenvolvemos soluções web em ruby.

As possibilidades nativas e o uso do erb ao inves do liquid, torna tudo mais simples e faz um desenvolvedor 
familiarizado com Ruby se sentir em casa.

Muitas pessoas podem se perguntar porque não usar outras alternativas como o Gatsby, Hugo, etc. A resposta é simples, o
Middleman é uma ferramenta que já conhecia e que me atende muito bem, então porque mudar?


## Razões para a migração

### 1. Queria mais controle e flexibilidade

Apesar de gostar muito do Jekyll, sentia que sempre estava "lutando" para alterar meu conteúdo ou adicionar novas
funcionalidades. 

Diferente disso, o Middleman sempre me ofereceu mais controle e flexibilidade sobre a estrutura e o design dos meus
projetos, facilidade de integrar com qualquer coisa que eu quisesse de forma natural e sem muitas dores de cabeça. 

### 2. Sistema de templates

O Middleman utiliza o sistema de templates ERB, Haml, Slim, entre outros, o que facilita a criação de layouts complexos 
e reutilizáveis. Isso se traduz em um desenvolvimento mais eficiente e uma manutenção mais simples. 

No Jekyll, embora os templates sejam poderosos, a sintaxe do Liquid pode ser limitada para certos casos de uso que eu 
precisava.

### 3. Ecossistema de plugins

O ecossistema de plugins do Middleman é robusto e altamente extensível, tendo praticamente tudo que eu preciso.

Mesmo se não tiver, acho a facilidade de criar um plugin para o Middleman muito boa. 

### 4. Experiência pessoal

Trabalhei um bom tempo com projetos frontend usando Middleman e sempre gostei da experiência, então a familiaridade com
a ferramenta foi um fator importante na minha decisão.

Usar o Middleman para o meu blog me permitiu usar o que eu ja sabia e manter o foco no que eu preciso, que é o conteúdo. 

## Conclusão

A migração do meu blog do Jekyll para o Middleman foi uma decisão que me trouxe muitos benefícios e melhorias.

Não estou dizendo que o Jekyll é ruim, pelo contrário, é uma ferramenta incrível e que me ajudou muito, mas o Middleman
sendo uma solução na qual tenho mais familiaridade, me permite ter menos friccção sobre manter ele e mais no conteúdo
que quero compartilhar.

Não espero que outras pessoas façam a mesma migração, mas espero que minha experiência possa ajudar alguém a tomar uma
decisão informada sobre qual ferramenta usar para o seu blog ou site estático, com base nas suas necessidades.

No final do dia, o que importa é você usar uma ferramenta que te atenda e não o hype do momento.
