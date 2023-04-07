---
layout: post
title:  "Novo projeto para organizar e centralizar informações"
---

Depois de ser diagnosticado com transtorno de déficit de atenção com hiperatividade (TDAH), passei a entender o porque de eu "funcionar ou ser afetado de formas específica" pelo excesso de demanda (que podem ser tarefas, projetos, investigações, etc).

Com isso, ja percebí a algum tempo que costumo funcionar muito bem quando tenho duas demanda para trabalhar em paralelo, sempre com uma mais prioritária, que geralmente também é a mais complexa e pode demandas mais tempo para ser entregue.

Essa "segunda demanda" (menos prioritária), uso como uma valvula da escape, e recorro a ela sempre que minha mente se encontra mais cansada daquele contexto mais complexo, trabalho um pouco com ela e com isso consigo buscar fôlego para prosseguir com a demanda principal.


## Qual o problema aqui?
Quando existe um aumento de demandas, que pode passar de três ao mesmo tempo, tenho visto que esse chaveamento passa a ficar desordenado, onde começo a demorar mais para "engrenar" nas tarefas que preciso fazer e sinto um crescimento de mensagens, compromissos em agenda, reuniões ou calls de alinhamento, mensagens direct e etc.

E com isso o domínio sobre as prioridades acaba ficando cada vez mais dificil e vou me tornando cada vez mais reativo sobre lidar com as tarefas e prever possiveis problemas.

Nesses casos, acabo entrando em um estado de foco e por vezes notificações e reagendamentos, principalmente os de "última hora" acabam passando desapercebidos.


## Como estou criando o projeto?
Estou construindo com uma stack eficiente e simples de manter, utilizando Ruby on Rails, sem reinventar a roda.

O projeto pretende ser uma plataforma que vai servir como um centralizador de informações, como um "mini datalake", onde estou criando long-runnings para atualizar informações de diversas fontes e centralizando tudo em apenas uma tabel

O proximo pa passo é criar pipelines que vão executar com agendamentos, buscando esses dados e armazenando de forma otimizada para consultas e outras tabelas.

Por fim e não menos importante, preciso de uma interface simples para criar visualizações, para criar e acompanhar a evolução das métricas.

Para consultar os dados e criar as apresentações, estou utilizando a gem blazer.

O próximo estágio é implementar mais schedulers para serviços essenciais e adicionar as pipelines nes para gerar essas tabelas otimizadas para consultas.

## Concluindo
É um projeto muito legal que tem me ajudado a experimentar coisas diferentes e praticar alguns conhecimento que não costumo usar todos os dias.

Com o término do projeto, pretendo criar uma implementação sobre o que foi feito e espero que me ajude nas tarefas cotidianas e tomadas de decisão.

Volto com updates quando tiver novidades. =)
