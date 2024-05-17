#!/bin/bash

read -p "Digite o nome do novo projeto: " novo_nome_projeto

arquivos=(
    "angular.json"
    "package-lock.json"
    "package.json"
    "src/app/app.component.spec.ts"
    "src/app/app.component.ts"
)

for arquivo in "${arquivos[@]}"; do
    if [ -f "$arquivo" ]; then
        sed -i "s/project-fed-functional/$novo_nome_projeto/g" "$arquivo"
        echo "Substituição realizada em: $arquivo"
    else
        echo "Arquivo não encontrado: $arquivo"
    fi
done

echo "Substituição concluída."

# Executar npm install
echo "Executando npm install..."
npm install

echo "Instalação concluída."

