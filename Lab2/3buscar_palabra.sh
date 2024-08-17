#!/bin/bash
# Integrantes: Camilo Castano-Sofia Gil
# Se debe entregar un nombre/parte de archivo ej: .txt - ejemplo.txt
# Se debe entregar una completitud/parte de una palabra ej: conf - configuration
nom_archivo=$1
palabra=$2
grep -no "$palabra" "$nom_archivo"
cantidad=$(grep -no "$palabra" "$nom_archivo" | wc -l)
echo "La cantidad de veces que se repiticion: $cantidad"
