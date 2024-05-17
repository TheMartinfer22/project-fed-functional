#!/bin/bash

read -p "Digite o nome do novo projeto: " novo_nome_projeto

diretorio_atual=$(pwd)

nome_diretorio_atual=$(basename "$diretorio_atual")

diretorio_pai=$(dirname "$diretorio_atual")

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
novo_diretorio="$diretorio_pai/$novo_nome_projeto"
mv "$diretorio_atual" "$novo_diretorio"
echo "Diretório renomeado para: $novo_diretorio"
cd "$novo_diretorio"
echo "Executando npm install..."
npm install

echo "Instalação concluída."

