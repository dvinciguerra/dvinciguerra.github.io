---
title: Utilizando userscripts para customizar sua experiencia na web
date: 2024-08-26 03:48 UTC
tags: tech, userscripts, web, productivity, addons, greasemonkey, tampermonkey
category: tech
layout: post
---

Sabe quando você acessa um site ou plataforma e pensa: "Poxa, isso aqui poderia ser diferente", ou "Seria ótimo se tivesse essa feature"? A solução que logo vem à cabeça de muitos desenvolvedores é criar uma extensão para o navegador, que altere o site ao ser acessado. Mas, apesar de criar um plugin não ser tão complicado, às vezes precisamos de algo mais rápido e simples.

É aí que entram os userscripts.

## Mas, o que são userscripts?

Userscripts são pequenos códigos que escrevemos para modificar determinados sites na web, personalizando a experiência de acordo com nossas necessidades. Em outras palavras, é uma maneira prática de tirar o máximo proveito das ferramentas que usamos no dia a dia.

## Alguns casos de uso

Eu já uso userscripts há algum tempo e eles têm melhorado minha experiência em diversas situações, como por exemplo:

* Criar um banner para me avisar que estou acessando o ambiente de staging.
* Automatizar o preenchimento de campos em formulários, quando os nomes seguem certos padrões.
* Esconder partes de sites que tiram minha atenção do que eu realmente preciso fazer.
* Adicionar teclas de atalho para aumentar minha produtividade.
* Colocar botões que facilitam o acesso a funcionalidades escondidas, mas que uso com frequência.

Como dá pra ver, os userscripts são extremamente versáteis e trazem uma série de benefícios.

## Como usar userscripts

Para começar a usar userscripts, existem alguns add-ons específicos que permitem injetar esses scripts nas páginas que você acessar. Geralmente, eles têm versões para os principais navegadores.

Aqui estão dois que eu costumo usar:

* **Greasemonkey**
* **Tampermonkey**

É só visitar a página deles, escolher o que mais te agrada e instalar.

## Exemplo prático

Vou compartilhar um script que criei para adicionar atalhos no Jira. Isso tem me ajudado a acessar alguns filtros e criar novos cards no board do time de forma mais rápida.

Vamos criar um script que adiciona um atalho para quando você digitar `ctrl + n`, criar um novo card automaticamente.

```javascript
// ==UserScript==
// @name     Jira :: Custom Shortcuts
// @namespace  dvinciguerra
// @version  1.0.0
// @grant    none
// @match      https://*.atlassian.net/jira/software/c/projects/*
// @author  Daniel Vinciguerra
// ==/UserScript==

document.addEventListener('keydown', (event) => {
  event = event || window.event
  if (event.ctrlKey && (event.key == "n" || event.key == "E")) {
    document.querySelector('#createGlobalItem').click()
  }
})
```

E pronto! Agora é só garantir que o script está ativo e, sempre que você entrar no Jira, o atalho vai estar funcionando.

## Conclusão

Como vimos, é bem fácil injetar novos comportamentos em aplicações web, melhorando a usabilidade e, consequentemente, nossa produtividade.

Embora exista uma comunidade grande de pessoas que criam scripts, eu prefiro seguir a regra de nunca usar scripts de terceiros por questões de segurança. Mas, no fim das contas, esses add-ons tornam nossa vida e o uso das ferramentas e plataformas web muito mais simples e produtivos.

Obrigado por ler e até o próximo artigo!

