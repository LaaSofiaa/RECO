#!/bin/bash
# Integrantes: Camilo Castano-Sofia Gil
# Script para listar los n archivos mas pequenos en un directorio, con opciones de filtrado.
#Slackware
# Comprobación de parámetros
if [ $# -lt 3 ]; then
    echo "Uso: $0 <directorio> <cantidad_archivos> <tam_max> [nombre_arch]"
    exit 1
fi

# Asignacion de parametros
directorio_arranque=$1
cantidad_archivos=$2
tam_max=$3
nombre_arch=$4

clear

# Lista de archivos segun los parametros
if [ -z "$nombre_arch" ]; then
    echo -e "Archivos encontrados:\n"
    find "$directorio_arranque" -type f -size "-${tam_max}c" 2>/dev/null | head -n "$cantidad_archivos"
else
    echo -e "Archivos con el nombre '$nombre_arch' encontrados:\n"
    find "$directorio_arranque" -type f -size "-${tam_max}c" -iname "*${nombre_arch}*" 2>/dev/null | head -n "$cantidad_archivos"
fi
