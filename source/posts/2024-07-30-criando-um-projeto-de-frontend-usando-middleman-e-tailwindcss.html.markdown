---
title: Criando um projeto de frontend usando Middleman e TailwindCSS
date: 2024-07-30
tags: ui, frontend, middleman, tailwindcss
category: tech
layout: post
---

Neste artigo, vamos criar um projeto de frontend usando Middleman e TailwindCSS.

## Introdução

Middleman é um gerador de sites estáticos que permite criar sites usando HTML, CSS e JavaScript. TailwindCSS é um
framework de CSS que facilita a criação de interfaces responsivas e bonitas.

## Criando um novo projecto 

Para criar um novo projecto com Middleman, execute o seguinte comando:

```bash
middleman init my_project
```

Este comando irá criar uma nova pasta chamada `my_project` com a estrutura básica de um projecto Middleman.

## Instalando o TailwindCSS

Para instalar o TailwindCSS no seu projecto, execute os seguintes comandos:

```bash
cd my_project
npm install -D tailwindcss
npx tailwindcss init
```

Em seguida, adicione o seguinte código ao seu ficheiro `tailwind.config.js`:

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {},
  },
  plugins: [],
}
```


Altere o nome do arquivo `site.css.scss` para `site.css`. e adicione o seguinte código:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

## Adicionando estilos ao seu projecto

Agora que o TailwindCSS está instalado, pode começar a adicionar estilos ao seu projecto. Por exemplo, pode adicionar
um botão com o seguinte código:

```html
<button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
  Button
</button>
```

## Compilando os ficheiros CSS 

Para compilar os ficheiros CSS do TailwindCSS, adicione o seguinte script ao seu ficheiro `package.json`:

```json
"scripts": {
  "build": "tailwindcss build stylesheets/site.css -o .tmp/dist/site.css"
}
```

Depois de adicionar o script, execute o seguinte comando para compilar os ficheiros CSS:

```bash
npm run build
```


## Alterando o config.rb do Middleman

Para que o Middleman compile os ficheiros CSS corretamente, adicione o seguinte código ao seu ficheiro `config.rb`:

```ruby
activate :external_pipeline,
  name: :webpack,
  command: build? ? "npm run build" : "npm run start",
  source: ".tmp/dist",
  latency: 1
```

## Conclusão

Neste artigo, criamos um projecto de frontend usando Middleman e TailwindCSS. Espero que este artigo tenha sido útil
example article. You probably want to delete it and write your own articles!


