---
layout: post
title:  "Criando um CLI para adicionar tasks no Todoist"
tags: tool, ruby, productivity, focus
---


Sou uma pessoa que funciona muito bem usando todo lists e gosto principalmente de usar ferramentas ou plataformas que permitam ter acesso as minhas tasks sempre que preciso.

Passei um momento da minha vida testando diversas delas e uma das que mais gostei foi o Google Tasks pela extrema simplicidade. Porém essa simplicidade toda me fez esbarrar em coisas que eu precisava muito e isso fez eu continuar a busca até chegar no Todoist que me atende perfeitamente.



## Todoist segundo meus critérios

É uma ferramenta poderosa e muito produtiva que permite uso diversos lugares, de smartphone até add-on de navegadores.

Além de tudo conta com várias interações e uma API muito completa e simples de usar.

A interface dele é super simples e direto ao ponto, mas sem deixar de ser poderosa, contando com lembretes, recorrência, suporte a AI para te ajudar a definir a tarefa e uma sintaxe que permite adicionar due dates em linguagem natural (tipo tomorrow, at Monday 9:00, next week, etc).



## Então qual o problema?

No meu workflow, uso muito o terminal e evito ao máximo "sair dele" porque sei que sou muito ruim em dividir atenção.

Isso me fez perceber que conforme o aumento do número ou complexidade das demandas, eu me esquecia de anotar minhas tarefas para serem feita.

Pode parecer besteira mas se para uma pessoa neurotípica é fácil esquecer algo quando está encarando um momento de stress, imagine uma pessoa TDAH.

Foi aí que comecei a procurar formar de ter essa forma simples de fazer esse registro das tarefas que precisava sem sair do terminal e chavear o contexto em que estava trabalhando.



## Buscando alternativas e testando hipóteses

Pensando muito e testando algumas ferramentas, várias muito boas mas me fariam não utilizar o Todoist.

Minha premissa era centralizar ao máximo essa "captura" das informações do que precisaria fazer e com isso me lembrei de uma solução inteligente que tinha visto em um repositório no Github do Tatsuhiko Miyagawa, um software engineer que acompanho desde que codava mais em Perl.

Ele acabou criando algo muito próximo do que eu queria, mas que aparentemente utilizava as notificações no sistema operacional para criar esses lembretes.



## Entendendo a referência para adaptar

O link para o script está aqui https://github.com/miyagawa/misc-scripts/blob/master/remind, mas explicando brevemente...

O script recebe como entrada uma frase em linguagem natural predefinida, algo como "remind me at night about do a code review" e usando regular expressions ele divide a sentença em duas partes.

A primeira diz sobre o tempo em que devo ser lembrado ou alertado e com essa parte ele utiliza uma Ruby gem chamada Chronic, para fazer parsing de texto em linguagem natural para data e hora.

A segunda parte da sentença e apenas a descrição do que precisa ser feito ou lembrado.

Com essas duas partes ele executa uma expressão, que faz uma chamada de sistema encadeando dois comandos: o sleep para aguardar o número de segundos até que ele seja alertado e quando o tempo chegar, o pushme que não conheço mas imagino ser um serviço de push notification que vai enviar esse lembrete para o computador ou smartphone.



## Adaptando e implementando a integração com Todoist

Entendendo esses comportamentos, adaptei o código para poder entender também português além de descrições em inglês e implementei o envio para minha conta do Todoist usando integração via API Rest.

O resultado foi uma ferramenta semelhante, que torna muito mais produtivo para mim anotado minhas tarefas e que centraliza todas as informações onde preciso.

Agradecimentos especiais, obviamente, ao autor original da ideia e do script que serviu de inspiração. =)

