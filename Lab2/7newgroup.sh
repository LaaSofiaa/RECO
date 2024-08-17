#!/bin/bash
# Integrantes: Camilo Castano-Sofia Gil
# Se debe entregar el nombre de un grupo 
# Se debe entregar el id del grupo 
nombre_grupo=$1
ID_grupo=$2

# Verificar si el grupo ya existe
if grep -q "^$nombre_grupo:" /etc/group; then
    echo "El grupo $nombre_grupo ya existe."
    exit 1
fi

# Creacion grupo
groupadd "$nombre_grupo" --gid "$ID_grupo"


if [ $? -eq 0 ]; then
    echo "Grupo $nombre_grupo creado exitosamente con ID $ID_grupo."
else
    echo "Error al crear el grupo $nombre_grupo."
fi