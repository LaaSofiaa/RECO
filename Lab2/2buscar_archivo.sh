#!/bin/bash
# Integrantes: Camilo Castano-Sofia Gil
# Se debe entregar un path ej: /etc
# Se debe entregar un nombre/parte de archivo ej: .txt - ejemplo.txt
path=$1
nom_arch=$2
# Busca nombre/parte de un archivo dada la ruta, ignorando los casos con mayúsculas
find "$path" -type f -iname "*$nom_arch*" | while read -r file; do
    echo "$file"
done

cantidad=$(find "$path" -type f -iname "*$nom_arch*" | wc -l)
echo "Cantidad de archivos encontrados: $cantidad"