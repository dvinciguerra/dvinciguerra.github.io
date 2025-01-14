---
title: Caracteres com acento em ruby
date: 2025-01-13 19:53 UTC
tags: til, ruby, caracteres, encoding
category: til
layout: post
---

_Este post não é exatamente um TIL, mas sim um post sobre um problema que tive e como resolvi._

## Problema

Estava pareando hoje para resolver um problema em uma regular expression e
precisavamos verificar se o antes e o pós de uma string continha caracteres
alfanuméricos.

Como estamos falando de português, acentos e cedilhas são comuns, então
precisavamos levar em conta esses caractéres também.


## Solução

Uma solução rápida foi adicionar os caracteres acentuados e cedilhas na regex,
como o range do `À` até o `ÿ`:

```ruby
[\wÀ-ÿ]
```

Dessa forma, conseguimos verificar se a string contém caracteres alfanuméricos.

Para entender melhor o range, podemos usar o método `chr` e `ord` para ver o código do caractere:

```ruby
chars = Array(0..255).map { _1.chr('utf-8') }
pp chars
```

E para utilizar fazer o processo inverso, podemos usar o método `ord`:

```ruby
pp chars.map(&:ord)
```

Se voce reparar, o range do `À` até o `ÿ` é de `192` até `255`.

Espero que isso ajude alguém que esteja com o mesmo problema que eu tive hoje.

