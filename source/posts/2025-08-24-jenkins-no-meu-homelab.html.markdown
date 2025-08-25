---
title: Jenkins no meu Homelab
date: 2025-08-24 23:48 UTC
tags: jenkins, homelab, deployment, devops, infraestructure, self-hosted
category: tech
layout: post
---



![](./2025-08-24-jenkins-no-meu-homelab/installing-jenkins.jpg)

Tem algumas plataformas que admiro há muito tempo — e o Jenkins é, sem dúvidas, uma delas.

Desde o meu primeiro contato em um dos lugares onde trabalhei, já percebi o enorme potencial que ele tinha.

## Como conheci o Jenkins

No trabalho, usávamos o Jenkins para executar testes e rodar os pipelines de deployment.
Ele foi lançado em 2011, e conheci a ferramenta uns dois ou três anos depois.

Naquela época, a entrega de software tinha seus processos, mas não era nem de longe tão complexa quanto é hoje.

Para ter uma ideia, o Docker só foi lançado em 2013 — antes disso, containers eram pouco difundidos, e muitas empresas de tecnologia ainda apostavam em máquinas virtuais ou providers como Heroku e AWS.

## Para que ele serve?

À primeira vista, o Jenkins pode parecer simples e até limitado.
No fim das contas, ele é um orquestrador de pipelines.
Sabe aquele seu GitHub Actions, CircleCI ou similares? É basicamente isso — só que em uma infraestrutura *self-hosted*.

Isso dá liberdade para cada empresa (ou pessoa) criar e customizar suas pipelines como quiser. Quer automatizar processos, gerar releases, executar builds, rodar testes sintéticos periódicos ou disparados por eventos? Tudo isso é possível — e o melhor: dentro da sua própria infraestrutura, sem depender de nenhum provider.

## Por que resolvi instalar no meu homelab?

Aqui em casa tenho uma estrutura bem particular, principalmente porque estou implementando processos de automação e smart home.
Segurança é fundamental nesse contexto, e poder rodar as coisas mais críticas localmente é uma grande vantagem.

Claro, eu poderia fazer tudo isso com crons e scripts nas minhas “linguagens favoritas”. Mas, honestamente, ter uma ferramenta madura, extensível e de altíssimo nível reduz demais o trabalho e a carga cognitiva para manter tudo funcionando no longo prazo.

Além disso, usando o Jenkins (e outras aplicações do gênero), consigo praticar hábitos importantes de criação e manutenção de infraestrutura.

## Para que estou usando atualmente?

Hoje, uso o Jenkins para automatizar alguns processos, fazer build de projetos que publico com o Portainer e rodar rotinas periódicas.

Também configurei o deployment deste blog para rodar via Jenkins (por que não?), além de algumas rotinas de manutenção nos servidores e máquinas da minha rede.

## Conclusão

Manter o Jenkins instalado no meu homelab me permite cuidar de processos de deployment e manutenção de diversas aplicações locais sem a necessidade de um Kubernetes para isso.

Mais do que isso, ele virou um verdadeiro laboratório de aprendizado contínuo aqui em casa — e, para mim, esse é o verdadeiro espírito de ter um homelab.
