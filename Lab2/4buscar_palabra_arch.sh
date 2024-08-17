#!/bin/bash
# Integrantes: Camilo Castano-Sofia Gil
# Se debe entregar un path ej: /etc
# Se debe entregar un nombre/parte de archivo ej: .txt - ejemplo.txt
# Se debe entregar una completitud/parte de una palabra ej: conf - configuration
path=$1
nom_arch=$2
palabra=$3

# Busqueda de archivo(s) en el path dado
archivos=$(find "$path" -iname "*$nom_arch*")

# Por cada archivo, busqueda de la palabra y cantidad de sus repeticiones
for archivo in $archivos; do
    
    cantidad=$(grep -no "$palabra" "$archivo" | wc -l) 
    if [ $cantidad -ne 0 ]; then # Solo los archivos que contienen la palabra
        echo "====> ARCHIVO: $archivo <====="
        grep -no "$palabra" "$archivo"
        echo "La cantidad de veces que se repitió ($palabra): $cantidad"
    fi
done