---
title: Mute and umute audio using terminal on Ubuntu
date: 2024-12-06 22:54 UTC
tags: today i learned, ubuntu, linux, terminal, audio
category: til
layout: post
---


Hoje precisei mutar o som do meu computador que com Ubuntu e estava utilizando uma outra maquina.

Não queria precisar me deslocar até o computador para mutar o som, então pesquisei como fazer isso via terminal.

Para minha surpresa, descobri em um post no [askubuntu](https://askubuntu.com/questions/26068/how-do-you-mute-from-the-command-line) que é possível mutar e desmutar o som utilizando o comando `amixer`.

#### Mutar o som e desmutar o som respectivamente

Para mutar e desmutar o som, utilize os comandos abaixo:

```bash
amixer set Master mute
amixer set Master unmute
```

#### Alternar entre mutar e desmutar o som

Também é possível alternar entre mutar e desmutar o som utilizando o comando abaixo:

```bash
amixer set Master toggle
```

#### Verificar o status do som

Para verificar o status do som, utilize o comando abaixo:

```bash
amixer get Master
```

Os comando retornam informações sobre o volume e se o som está mutado ou não, com um output parecido com o abaixo:

```text
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 75 [86%] [-9.00dB] [off]
```

Onde na ultima linha, a palavra `off` indica que o som está mutado.
