#!/bin/bash

echo "Crear Proyecto React"
#crear proyecto con nombre
read -p "Ruta del proyecto -> " ruta
read -p "Nombre del Proyecto -> " nombre

#dirigirse a la ruta
cd $ruta
mkdir "$nombre"

#crear la carpeta contenedora
cd ./$nombre

json='
{
  "name": "tato",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts":{
  "dev":"vite",
  "test":"vitest",
  "build":"build vitest"
},
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "@vitejs/plugin-react": "3.1.0",
    "happy-dom": "8.9.0",
    "vite": "4.1.4",
    "vitest": "0.29.1"
  },
  "dependencies": {
    "react": "18.2.0",
    "react-dom": "18.2.0"
  }
}
'

echo "$json">> package.json


contentViteConfig='import react from "@vitejs/plugin-react"
import { defineConfig } from "vite"

export default defineConfig({
  plugins: [react()],
  test: {
    environment: "happy-dom"
  }
})
'

contentIndex="<!DOCTYPE html>
<html lang='en'>
<head>
    <meta name='title' content='titulo'>
    <meta name='description' content='descriccion'>
    <meta name='keywords' content='keywords'>
    <meta name='author' content='Gianfranco Marquez Ruiz'>
    <!-- OPEN GRAPH TAGS -->
    <meta property='og:image' content='#'>
    <meta property='og:title' content='Gianfranco Marquez ...'>
    <meta property='og:description' content='descriccion'>
    <meta property='og:url' content='#'>
    <meta property='og:type' content='website' />
    <meta property='og:image:width' content='1280' />
    <meta property='og:image:height' content='720' />

    <!-- twitter TAGS -->
    <meta name='twitter:title' content='Gianfranco Marquez ...' />
    <meta name='twitter:description' content='descriccion' />
    <meta name='twitter:image' content='#' />

    <link rel='icon' type='image/svg+xml' href='./src/img/nav/icokake.svg' />
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Vite Project</title>
</head>
<body>
    <div id='root'></div>
    <script type='module' src='./src/Main.jsx'></script>
</body>
</html>"

echo "$contentViteConfig" >> vite.config.js
echo "$contentIndex" >> index.html
mkdir src

contentMain="
import React from 'react'
import ReactDOM from 'react-dom/client'
import './style.css'

ReactDOM.createRoot(document.getElementById('root')).render(
    <React.StrictMode>
        <h1>Hola mundo</h1>
    </React.StrictMode>
)
"
cd ./src
#creacion de archivo css principal
touch style.css
#creacion de carpetas contenedoras
mkdir components
mkdir data
mkdir public
mkdir image
mkdir layer
mkdir helpers
mkdir customHooks
mkdir context
mkdir modules
#crear Main.jsx con contenido importado
echo "$contentMain" >> Main.jsx


cd ..

code .

npm i